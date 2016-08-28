function [ code ] = code_to_symbol( code )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
if ischar(code)
else
    code=num2str(code);
    while length(code)<6
        code=['0',code];
    end
end
if code(1)=='6'
    code=['sh',code];
elseif code(1)=='3'||code(1)=='0'
    code=['sz',code];
end

end

