


mkdir(strcat(pwd,'/Temp'));
cd Temp;

filename = strcat('report_test.txt');
fid = fopen(filename, 'a+');
fprintf(fid, '------------------------------------------------\n');
fclose(fid);

make_template('type','PL','project_name','my_project0','input','x0:3:fix:10:10','input','x1:1:fix:9:9','output','y0:2:fix:5:5');
fid = fopen(filename, 'a+');
fprintf(fid, '== make_template test -> SECCESSFULLY\n');
fclose(fid);
ip_design_duplicate('from','my_project0','to','my_project1');
fid = fopen(filename, 'a+');
fprintf(fid, '== ip_design_duplicate test -> SECCESSFULLY\n');
fclose(fid);
ip_design_delete('project_name','my_project0');
fid = fopen(filename, 'a+');
fprintf(fid, '== ip_design_delete test -> SECCESSFULLY\n');
fclose(fid);
ip_design_test('project_name','my_project1','type_test','c','num_test',2);
fid = fopen(filename, 'a+');
fprintf(fid, '== ip_design_test C test -> SECCESSFULLY\n');
fclose(fid);
ip_design_test('project_name','my_project1','type_test','xsim','num_test',1);
fid = fopen(filename, 'a+');
fprintf(fid, '== ip_design_test XSIM test -> SECCESSFULLY\n');
fclose(fid);
ip_design_build('project_name','my_project1','fclk', 150)
fid = fopen(filename, 'a+');
fprintf(fid, '== ip_design_build test -> SECCESSFULLY\n');
fclose(fid);
ip_prototype_build('project_name','my_project1','board_name','zedboard');
fid = fopen(filename, 'a+');
fprintf(fid, '== ip_prototype_build test -> SECCESSFULLY\n');
fclose(fid);
ip_prototype_load('project_name','my_project1','board_name','zedboard','type_eth','udp');
fid = fopen(filename, 'a+');
fprintf(fid, '== ip_prototype_load test -> SECCESSFULLY\n');
fclose(fid);
ip_prototype_test('project_name','my_project1','board_name','zedboard','num_test',10);
fid = fopen(filename, 'a+');
fprintf(fid, '== ip_prototype_test test -> SECCESSFULLY\n');
fclose(fid);

cd ..

type(filename)
delete(filename)
clear functions
rmdir(strcat(pwd,'/Temp'),'s')


