[~, results] = evalc('runtests()');

T = table(results);
T.Row = T.Name;
T = T(:, {'Passed', 'Duration'});
disp(T);
