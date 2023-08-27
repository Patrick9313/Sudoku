for i=1:9
	for j=1:9
        fprintf([num2str(reshape(cur_mark(i,j,:),1,[])*[1:9]','%1d'),' ']);
    end
	fprintf('\n');
end 