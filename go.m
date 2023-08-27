init_data;
tic;
 
cell=1;
while (cell<=Order*Order && cell>0)
    oneround;
end
if cell==Order*Order+1
    fprintf('\nIt took %6.2f s.\n',toc);
    fprintf('The answer is:\n');
     print_result;
elseif cell==0
    fprintf('\nThe puzzle has no answer!\n');
end
plot([1:cell_record_ptr-1],cell_record(1:cell_record_ptr-1),'-*');