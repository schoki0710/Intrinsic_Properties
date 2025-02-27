function [all_events,colHeader] = paramFromSpiko_new(channelname, exclusion)
%% returns the following outputs
% all_events: single table with allexported events. A first column
% corresopnd to the episode number
% colHeader: correspond to the name of the different columns in the
% all_events table
%% as inputs
% - channelname='IntraVm_IN0'; %%% the name of the 
% - exclusion = []; % spikoscope index of the channels to exclude; [] if
% none, then exclusion should not be empty 
% Example: [all_events,colHeader] = paramFromSpiko_new('IntraVm_IN0', [])
if isempty(exclusion)==1
    exclusion = -2;% exclude episode -2
end
%% looking into the current folder, for files with channelname in there name and count them.
filesfromchannel = dir(['*' channelname '*'] ); % find the files
nbStep = length(filesfromchannel); % file count
if ~isempty(nbStep) % if it does not find files, 
    % define empty matrix that will be fill up iteratively
    param = [];spiko_ep=[];
    nbepisode = 0; % this value will increase at each step
    for i=1:nbStep %%% for the first to the last episode
        spikoepisodeindex = i-1; % the spikoscope files start at 0;
        thatexportname = ['episode_' num2str(spikoepisodeindex) channelname '.txt']; % the name of the file corresponding to the episode
        if ~(spikoepisodeindex == exclusion) % if the episode has not been excluded
            if exist(thatexportname, 'file') % if the file exists
                nbepisode = nbepisode+1;  % the value increases at each iteration
                %% ignore that part
%                 stringarrayimport = table2array(readtable(thatexportname, 'delimiter', '\t'));
%                 stringarrayimport = table2array(readtable(thatexportname));
%                 colHeader = stringarrayimport(1, :);
%                 data = str2double(stringarrayimport(2:end, :));
                %%
                % import the date from the file as a structure containing
                % the data and "textdata", whihc in that case correspond to
                % the column headers (name of the columns)
                importofexport = importdata(thatexportname); % the imported structure 
                colHeader = importofexport.textdata(end, :);% the last line (line 2) contains the column headers
                data = importofexport.data; % the data
                if ~isempty(data) % only if there is data
%                     clear param_inter spiko_ep_inter
                    % extra steps because of nans ate the end of the table sometimes 
                    param_inter = nan(length(data(:,1)), length(colHeader)); % this might bug...
                    param_inter(1:length(data(:,1)),1:length(data(1,:)))=data;% this might bug...
                    spiko_ep_inter = nan(length(data(:,1)), 1);
                    spiko_ep_inter(1:length(data(:,1)),1) = i;% this might bug...
                    
                    % add the episode index at the beginning of the table
                    param = cat(1,param, param_inter); 
                    spiko_ep = cat(1,spiko_ep, spiko_ep_inter);
                end
            end
        end
    end
    %%%% concatenate the data from the current export with
    %%%% the matrix of all event from all exports
    %%%% (it is empty at the first iteration and grows at each iteration)
    all_events = cat(2,spiko_ep, param);
else
    disp('No export files in that folder - or wrong name')
end
clear param_inter data nbStep filesfromchannel stringarrayimport spiko_ep_inter...
    step_idx param i exclusion nbepisode spikoepisodeindex

%% add the name of the first column and shift the others
colHeader = ['EpisodeSpikoscope' colHeader];
%% save the results in a matlab file.
save('paramsFromSpiko', 'all_events', 'colHeader')
%% how to find what each column correspond to
col.episodespikoscope = 1; %%% 
col.Begin = find(strcmp('Begin_(mV)', colHeader(1,:)));
col.peakTime = find(strcmp('End_(s)', colHeader(1,:)));
col.maxPeak = find(strcmp('End_(mV)', colHeader(1,:)));
%% example plots from these export
spikeTime = all_events(:,col.peakTime);
figure;h = histogram(spikeTime, 200, 'normalization', 'count');
binnedtime = h.BinEdges(1:end-1)+h.BinWidth/2; countepsp =  h.Values;close;
amplitude = all_events(:,col.maxPeak) - all_events(:,col.Begin);

epidx = all_events(:,col.episodespikoscope);

figure('position', [200 200 800 600], 'color', 'w')

subplot(312)
plot(spikeTime, epidx, '+k')
axis tight
ylabel('trial #')
set(gca, 'TickDir', 'out', 'box', 'off', 'visible', 'off')

subplot(311)
bar(binnedtime, countepsp, 'facecolor','k', 'edgecolor', 'k')
axis tight
ylabel('epep count')
set(gca, 'TickDir', 'out', 'box', 'off')

subplot(313)
plot(spikeTime, amplitude, 'ok')
set(gca, 'TickDir', 'out', 'box', 'off')
xlabel('time (sec)')
ylabel('detected epsp amplitude (mV)')
axis tight
saveas(gca, 'FigureHistoAndAmplitudes.jpeg')

end 