if isempty(strfind(path,[cd '/Functions']))
    path([cd '/Functions'], path)
end