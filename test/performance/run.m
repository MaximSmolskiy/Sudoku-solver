[~, results] = evalc('runperf()');

T = sampleSummary(results);
T.Row = cellstr(T.Name);
T.Name = [];
disp(T);
