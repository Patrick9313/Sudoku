for i=1:9
	for j=1:9
        fprintf([num2str(reshape(cur_mark(i,j,1:3),1,[]).*[1 2 3],'%1d'),' ']);
    end
	fprintf('\n');
	for j=1:9
        fprintf([num2str(reshape(cur_mark(i,j,4:6),1,[]).*[4 5 6],'%1d'),' ']);
    end
	fprintf('\n');
    for j=1:9
        fprintf([num2str(reshape(cur_mark(i,j,7:9),1,[]).*[7 8 9],'%1d'),' ']);
    end
	fprintf('\n'); 
	fprintf('\n');
end