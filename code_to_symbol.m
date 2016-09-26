function [ code ] = code_to_symbol( code )
%user input code to actual code 
if ischar(code) % Ö¸Êý 
    if strcmp(code,'hs300')
        code = 'sz399300';
    elseif strcmp(code,'sh')
        code ='sh000001';
    elseif strcmp(code,'sz')
            code = 'sz399001';
    elseif strcmp(code,'sz50')
        code ='sh000016';
    elseif strcmp(code,'zxb')
        code ='sz399005';
    elseif strcmp(code,'cyb')
            code ='sz399006';
    elseif  strcmp(code,'sz300')
            code ='sz399008';
    elseif  strcmp(code,'zh500')
        code = 'sh000905';
    end 
else %ÆÕÍ¨
    code=num2str(code);
    while length(code)<6
        code=['0',code];
    end
end
if code(1)=='6'||code(1)=='5'||code(1)=='9'
    code=['sh',code];
elseif code(1)=='3'||code(1)=='0'
    code=['sz',code];
end

end

