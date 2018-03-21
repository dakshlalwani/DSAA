clc;
clear;
% a)
[inp, fs] = audioread('sounditem.wav');
newfs = 24000;
% b) part's test frequencies
% newfs = 16000;
% newfs = 8000;
% newfs = 4000;
answer = zeros(floor(size(inp,1)*(newfs/fs)),2);
count = 0;
for i = 1:floor((size(inp,1)*newfs)/fs)
    count = count + (fs/newfs);
    if (ceil(count) ~= floor(count))
        answer(i,:) = inp(floor(count),:) + (inp(ceil(count),:) - inp(floor(count),:)).*(count-floor(count));
    else
        answer(i,:) = inp(round(count),:);
    end
end

sound(answer,newfs);

% c)
% 1)
[inp2, ~] = audioread('sounditem.wav');
fr = 44100;
[filter, fs] = audioread('perth_city_hall_balcony_ir_edit.wav');
filter = resample(filter,fr,fs);
answer = [conv(inp2(:,1),filter(:,1)), conv(inp2(:,2),filter(:,2))];
sound(answer,fr);

% 2)
[inp2, ~] = audioread('sounditem.wav');
fr = 44100;
[filter, fs] = audioread('ir_purnode_tunnel_balloon_48k.wav');
filter = resample(filter,fr,fs);
answer = [conv(inp2(:,1),filter(:,1)), conv(inp2(:,2),filter(:,2))];
sound(answer,fr);

% 3)
[inp2, ~] = audioread('sounditem.wav');
fr = 44100;
[filter, fs] = audioread('living_room_1.wav');
filter = resample(filter,fr,fs);
answer = [conv(inp2(:,1),filter(:,1)), conv(inp2(:,2),filter(:,2))];
sound(answer,fr);
