%数独游戏阶数
Order=9;
 
%mark 表格，下标含义：行坐标，列坐标，数项
cur_mark=ones(Order,Order,Order);

%记录每一步的 mark 表格变化
%%第 4 维下标代表第几格（从 1 到 Order*Order 对应从左到右，逐行向下）
diff_mark=zeros(Order,Order,Order,Order*Order);

%数项选择指针
%%下标表示第几格，数值代表下一轮将对应的数项
ptrs=ones(1,Order*Order);

%数格成组（哪几个组成一宫）定义
%%第 3 维下标表示第几组（宫）
%%数值含义：行坐标，列坐标
groups=zeros(Order,2,6);
groups(:,:,1)=[1 1; 1 2; 1 3; 2 1; 2 2; 2 3; 3 1; 3 2; 3 3];
groups(:,:,2)=[1 4; 1 5; 1 6; 2 4; 2 5; 2 6; 3 4; 3 5; 3 6];
groups(:,:,3)=[1 7; 1 8; 1 9; 2 7; 2 8; 2 9; 3 7; 3 8; 3 9];
groups(:,:,4)=[4 1; 4 2; 4 3; 5 1; 5 2; 5 3; 6 1; 6 2; 6 3];
groups(:,:,5)=[4 4; 4 5; 4 6; 5 4; 5 5; 5 6; 6 4; 6 5; 6 6];
groups(:,:,6)=[4 7; 4 8; 4 9; 5 7; 5 8; 5 9; 6 7; 6 8; 6 9];
groups(:,:,7)=[7 1; 7 2; 7 3; 8 1; 8 2; 8 3; 9 1; 9 2; 9 3];
groups(:,:,8)=[7 4; 7 5; 7 6; 8 4; 8 5; 8 6; 9 4; 9 5; 9 6];
groups(:,:,9)=[7 7; 7 8; 7 9; 8 7; 8 8; 8 9; 9 7; 9 8; 9 9];
groups(:,:,10)=[1 1; 2 2; 3 3; 4 4; 5 5; 6 6; 7 7; 8 8; 9 9];
groups(:,:,11)=[1 9; 2 8; 3 7; 4 6; 5 5; 6 4; 7 3; 8 2; 9 1];

%预先已填的数字
%%数值含义：行坐标，列坐标，数项
init_digit=[1 3 3; 1 7 7; 3 1 9; 3 4 1; 3 6 6; 3 9 2; 4 3 7; 4 5 3; 4 7 9; 5 4 7; 5 6 2; 6 3 8; 6 5 1; 6 7 4; 7 1 6; 7 4 3; 7 6 7; 7 9 5; 9 3 5; 9 7 1];
for i=1:size(init_digit,1)
    cur_mark=refresh_mark(groups,cur_mark,init_digit(i,1),init_digit(i,2),init_digit(i,3));
end

%记录搜索过程,预开足够多个记录单元
cell_record=zeros(1,100000);
cell_record_ptr=1;