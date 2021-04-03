clear;clc;

%% Performance Data
EG_P1=[
3.4400    3.1374    2.5823
3.8659    3.6903    2.5271
4.2218    4.0253    2.2008
4.2341    3.8735    2.1445
4.2364    3.9012    2.0890
4.2330    3.8413    2.0827
4.0253    3.5506    1.8855
3.9432    3.5023    1.8919
];

CH_P1=[
1.0000    1.0000    0.9770
1.0000    1.0000    0.9000
1.0000    1.0000    0.7997
0.9969    0.9906    0.7733
0.9942    0.9929    0.7486
0.9926    0.9838    0.7306
0.9786    0.9721    0.6818
0.9705    0.9657    0.6649    
];

Time_P1=[
6.7982    0.0491    0.0010
21.7545    0.0761    0.0010
31.8562    0.1105    0.0014
38.5046    0.1307    0.0015
74.3483    0.1589    0.0015
146.4582    0.1778    0.0017
487.4830    0.2156    0.0020
757.9589    0.3022    0.0086    
];

EG_P2=[
3.9710    3.7084    2.8902
4.6696    4.4523    2.3820
5.6534    5.1111    2.0104
6.1304    5.2799    1.7678
6.5038    5.1374    1.7105
6.5510    4.6880    1.5188
7.0654    4.5582    1.5133
6.9602    4.6854    1.4943    
];

CH_P2=[
1.0000    1.0000    0.9792
1.0000    1.0000    0.8292
1.0000    0.9903    0.6833
0.9990    0.9792    0.6281
0.9967    0.9642    0.5725
0.9806    0.9174    0.4840
0.9801    0.9107    0.4720
0.9604    0.8927    0.4583    
];

Time_P2=[
7.4438    0.0667    0.0012
18.4743    0.1049    0.0016
18.0684    0.1778    0.0021
20.5128    0.1898    0.0023
 31.7881    0.2209    0.0023
 153.3777    0.2277    0.0029
374.2171    0.3599    0.0086
 709.4593    0.3842    0.0095    
];

%% Figure Drawing
x=20:20:160;
marker=["-o","-+","-*","-x","-s","-d"];
curve_LineWidth=5.6;
curve_MarkerSize=20;
box_LineWidth=3.6;
box_FontSize=48;
lgd_FontSize=40;

figure(1);
hold on;
for ii=1:3
    plot(x,EG_P1(:,ii),marker(ii),'LineWidth',curve_LineWidth,'MarkerSize',curve_MarkerSize);
end
hold off;
xlabel('Number of Requests');
ylabel('Energy Gain');
ylim([1.5,4.6]);
set(gca,'LineWidth',box_LineWidth,'FontName','Times New Roman',...
    'FontSize',box_FontSize,'FontWeight','bold');
lgd=legend({'Optimal','GSAC','Random'},'Orientation','horizontal',...
    'Location','north','FontSize',lgd_FontSize);
grid minor;
box on;

figure(2);
H=bar(x,CH_P1,'grouped');
H(1).FaceColor='#bbbbbb';
H(2).FaceColor='#999999';
H(3).FaceColor='#666666';
ylim([0.4,1.1]);
xlabel('Number of Requests');
ylabel('Cache-hit Ratio');
set(gca,'LineWidth',box_LineWidth,'FontName','Times New Roman',...
    'FontSize',box_FontSize,'FontWeight','bold');
lgd=legend({'Optimal','GSAC','Random'},'Orientation','horizontal',...
    'Location','north','FontSize',lgd_FontSize);
grid minor;
box on;


figure(3);
hold on;
for ii=1:3
    plot(x,EG_P2(:,ii),marker(ii),'LineWidth',curve_LineWidth,'MarkerSize',curve_MarkerSize);
end
hold off;
xlabel('Number of Requests');
ylabel('Energy Gain');
set(gca,'LineWidth',box_LineWidth,'FontName','Times New Roman',...
    'FontSize',box_FontSize,'FontWeight','bold');
lgd=legend({'Optimal','GSAC','Random'},'Orientation','horizontal',...
    'Location','north','FontSize',lgd_FontSize);
grid minor;
box on;

figure(4);
H=bar(x,CH_P2,'grouped');
H(1).FaceColor='#bbbbbb';
H(2).FaceColor='#999999';
H(3).FaceColor='#666666';
ylim([0.4,1.1]);
xlabel('Number of Requests');
ylabel('Cache-hit Ratio');
set(gca,'LineWidth',box_LineWidth,'FontName','Times New Roman',...
    'FontSize',box_FontSize,'FontWeight','bold');
lgd=legend({'Optimal','GSAC','Random'},'Orientation','horizontal',...
    'Location','north','FontSize',lgd_FontSize);
grid minor;
box on;

figure(5);
hold on;
for ii=1:3
    plot(x,Time_P1(:,ii),marker(ii),'LineWidth',curve_LineWidth,'MarkerSize',curve_MarkerSize);
end
hold off;
xlabel('Number of Requests');
ylabel('Time (second)');
set(gca,'YScale','log','YTick',[1e-3,1e0,1e3],'LineWidth',box_LineWidth,...
    'FontName','Times New Roman','FontSize',box_FontSize,'FontWeight','bold');
lgd=legend({'Optimal','GSAC','Random'},'Orientation','horizontal','Location','north',...
    'FontSize',lgd_FontSize);
grid minor;
box on;

figure(6);
hold on;
for ii=1:3
    plot(x,Time_P2(:,ii),marker(ii),'LineWidth',curve_LineWidth,'MarkerSize',curve_MarkerSize);
end
hold off;
xlabel('Number of Requests');
ylabel('Time (second)');
set(gca,'YScale','log','YTick',[1e-3,1e0,1e3],'LineWidth',box_LineWidth,...
    'FontName','Times New Roman','FontSize',box_FontSize,'FontWeight','bold');
lgd=legend({'Optimal','GSAC','Random'},'Orientation','horizontal','Location','north',...
    'FontSize',lgd_FontSize);
grid minor;
box on;

%% Bandwidth-Memory
spacing=0.25;
Bandwidth=0.25:spacing:1;
Memory=Bandwidth;
labelSpacing=850;

EG_P1=[
2.3365    1.9550    1.4385	3.9227    3.4082    2.1701	4.4495    4.1445    2.6825	 4.7213    4.5881    3.6827
3.3526    2.9545    1.4366	4.2364    3.9012    2.0890	4.6396    4.4532    2.8655	4.7337    4.6157    3.8581
3.6596    3.3191    1.4669	4.2482    3.9617    2.0100	4.6140    4.4198    2.8722	4.7269    4.5977    3.4637
3.6572    3.3580    1.4506	4.2513    3.9450    2.1315	4.6842    4.5402    3.0278	 4.7222    4.6207    3.2578
];
EG_P1_Optimal=EG_P1(:,1:3:10);
EG_P1_Heuristic=EG_P1(:,2:3:11);
EG_P1_Random=EG_P1(:,3:3:12);
[DB_Optimal,DM_Optimal]=gradient(EG_P1_Optimal,spacing);
[DB_Huristic,DM_Huristic]=gradient(EG_P1_Heuristic,spacing);
[DB_Random,DM_Random]=gradient(EG_P1_Random,spacing);

figure(7);
hold on;
[C,h]=contour(Bandwidth,Memory,EG_P1_Optimal,'ShowText','on','LineWidth',curve_LineWidth);
v=3:0.4:4.6;
clabel(C,h,v,'FontSize',lgd_FontSize,'FontWeight','bold','LabelSpacing',labelSpacing);
quiver(Bandwidth,Memory,DB_Optimal,DM_Optimal,'LineWidth',curve_LineWidth);
xlabel('Bandwidth (Gbps)');
ylabel('Caching Memory (GB)');
set(gca,'LineWidth',box_LineWidth,'FontName','Times New Roman',...
    'FontSize',box_FontSize,'FontWeight','bold');
grid minor;
box on;
axis equal;
hold off;

figure(8);
hold on;
[C,h]=contour(Bandwidth,Memory,EG_P1_Heuristic,'ShowText','on','LineWidth',curve_LineWidth);
v=3:0.5:4.5;
clabel(C,h,v,'FontSize',lgd_FontSize,'FontWeight','bold','LabelSpacing',labelSpacing);
quiver(Bandwidth,Memory,DB_Huristic,DM_Huristic,'LineWidth',curve_LineWidth);
xlabel('Bandwidth (Gbps)');
ylabel('Caching Memory (GB)');
set(gca,'LineWidth',box_LineWidth,'FontName','Times New Roman',...
    'FontSize',box_FontSize,'FontWeight','bold');
grid minor;
box on;
axis equal;
hold off;

figure(9);
hold on;
[C,h]=contour(Bandwidth,Memory,EG_P1_Random,'ShowText','on','LineWidth',curve_LineWidth);
v=1.5:0.5:3.5;
clabel(C,h,v,'FontSize',lgd_FontSize,'FontWeight','bold','LabelSpacing',labelSpacing);
quiver(Bandwidth,Memory,DB_Random,DM_Random,'LineWidth',curve_LineWidth);
xlabel('Bandwidth (Gbps)');
ylabel('Caching Memory (GB)');
set(gca,'LineWidth',box_LineWidth,'FontName','Times New Roman',...
    'FontSize',box_FontSize,'FontWeight','bold');
grid minor;
box on;
axis equal;
hold off;

CH_P1=[
0.7516    0.7173    0.5078	0.9581    0.9361    0.7341	0.9872    0.9829    0.8504	1.0000    0.9986    0.9508
0.9454    0.9414    0.5027	0.9942    0.9929    0.7486	1.0000    1.0000    0.8759	1.0000    1.0000    0.9742
0.9957    0.9943    0.5337	1.0000    1.0000    0.7174	1.0000    1.0000    0.8688	1.0000    1.0000    0.9341
1.0000    1.0000    0.5154	1.0000    1.0000    0.7494	1.0000    1.0000    0.8815	1.0000    1.0000    0.9125
];
CH_P1_Optimal=CH_P1(:,1:3:10);
CH_P1_Heuristic=CH_P1(:,2:3:11);
CH_P1_Random=CH_P1(:,3:3:12);
[DB_Optimal,DM_Optimal]=gradient(CH_P1_Optimal,spacing);
[DB_Huristic,DM_Huristic]=gradient(CH_P1_Heuristic,spacing);
[DB_Random,DM_Random]=gradient(CH_P1_Random,spacing);

figure(10);
hold on;
[C,h]=contour(Bandwidth,Memory,CH_P1_Optimal,'ShowText','on','LineWidth',curve_LineWidth);
v=0.9:0.1:1;
clabel(C,h,v,'FontSize',lgd_FontSize,'FontWeight','bold','LabelSpacing',labelSpacing);
quiver(Bandwidth,Memory,DB_Optimal,DM_Optimal,'LineWidth',curve_LineWidth);
xlabel('Bandwidth (Gbps)');
ylabel('Caching Memory (GB)');
set(gca,'LineWidth',box_LineWidth,'FontName','Times New Roman',...
    'FontSize',box_FontSize,'FontWeight','bold');
grid minor;
box on;
axis equal;
hold off;

figure(11);
hold on;
[C,h]=contour(Bandwidth,Memory,CH_P1_Heuristic,'ShowText','on','LineWidth',curve_LineWidth);
v=[0.85,0.95,1];
clabel(C,h,v,'FontSize',lgd_FontSize,'FontWeight','bold','LabelSpacing',labelSpacing);
quiver(Bandwidth,Memory,DB_Huristic,DM_Huristic,'LineWidth',curve_LineWidth);
xlabel('Bandwidth (Gbps)');
ylabel('Caching Memory (GB)');
set(gca,'LineWidth',box_LineWidth,'FontName','Times New Roman',...
    'FontSize',box_FontSize,'FontWeight','bold');
grid minor;
box on;
axis equal;
hold off;

figure(12);
hold on;
[C,h]=contour(Bandwidth,Memory,CH_P1_Random,'ShowText','on','LineWidth',curve_LineWidth);
v=0.5:0.1:0.9;
clabel(C,h,v,'FontSize',lgd_FontSize,'FontWeight','bold','LabelSpacing',labelSpacing);
quiver(Bandwidth,Memory,DB_Random,DM_Random,'LineWidth',curve_LineWidth);
xlabel('Bandwidth (Gbps)');
ylabel('Caching Memory (GB)');
set(gca,'LineWidth',box_LineWidth,'FontName','Times New Roman',...
    'FontSize',box_FontSize,'FontWeight','bold');
grid minor;
box on;
axis equal;
hold off;


EG_P2=[
2.8766    2.0303    1.3570	5.4186    3.4475    1.6576	5.6124    4.7573    2.1963	6.9259    6.4378    2.5980
5.5326    3.7419    1.3370	6.5038    5.1374    1.7105	6.9785    6.4587    2.0580	6.9905    6.5546    2.5297
6.2626    5.2916    1.3117	6.9003    6.2574    1.7628	6.9855    6.6323    1.9886	6.9549    6.6557    2.4896
6.1004    5.4621    1.2844	6.6124    5.9671    1.7730	7.0527    6.5649    2.0052	6.8484    6.6794    2.6061
];
EG_P2_Optimal=EG_P2(:,1:3:10);
EG_P2_Heuristic=EG_P2(:,2:3:11);
EG_P2_Random=EG_P2(:,3:3:12);
[DB_Optimal,DM_Optimal]=gradient(EG_P2_Optimal,spacing);
[DB_Huristic,DM_Huristic]=gradient(EG_P2_Heuristic,spacing);
[DB_Random,DM_Random]=gradient(EG_P2_Random,spacing);

figure(13);
hold on;
[C,h]=contour(Bandwidth,Memory,EG_P2_Optimal,'ShowText','on','LineWidth',curve_LineWidth);
v=4:1:7;
clabel(C,h,v,'FontSize',lgd_FontSize,'FontWeight','bold','LabelSpacing',labelSpacing);
quiver(Bandwidth,Memory,DB_Optimal,DM_Optimal,'LineWidth',curve_LineWidth);
xlabel('Bandwidth (Gbps)');
ylabel('Caching Memory (GB)');
set(gca,'LineWidth',box_LineWidth,'FontName','Times New Roman',...
    'FontSize',box_FontSize,'FontWeight','bold');
grid minor;
box on;
axis equal;
hold off;

figure(14);
hold on;
[C,h]=contour(Bandwidth,Memory,EG_P2_Heuristic,'ShowText','on','LineWidth',curve_LineWidth);
v=3.5:1:6.5;
clabel(C,h,v,'FontSize',lgd_FontSize,'FontWeight','bold','LabelSpacing',labelSpacing);
quiver(Bandwidth,Memory,DB_Huristic,DM_Huristic,'LineWidth',curve_LineWidth);
xlabel('Bandwidth (Gbps)');
ylabel('Caching Memory (GB)');
set(gca,'LineWidth',box_LineWidth,'FontName','Times New Roman',...
    'FontSize',box_FontSize,'FontWeight','bold');
grid minor;
box on;
axis equal;
hold off;

figure(15);
hold on;
[C,h]=contour(Bandwidth,Memory,EG_P2_Random,'ShowText','on','LineWidth',curve_LineWidth);
v=1.4:0.2:2.4;
clabel(C,h,v,'FontSize',lgd_FontSize,'FontWeight','bold','LabelSpacing',labelSpacing);
quiver(Bandwidth,Memory,DB_Random,DM_Random,'LineWidth',curve_LineWidth);
xlabel('Bandwidth (Gbps)');
ylabel('Caching Memory (GB)');
set(gca,'LineWidth',box_LineWidth,'FontName','Times New Roman',...
    'FontSize',box_FontSize,'FontWeight','bold');
grid minor;
box on;
axis equal;
hold off;

CH_P2=[
0.7610    0.6640    0.4085	0.9433    0.8358    0.5617	0.9550    0.9325    0.7158	1.0000    0.9883    0.7800
0.9683    0.8833    0.4008	0.9967    0.9642    0.5725	1.0000    0.9942    0.6600	1.0000    0.9908    0.7733
0.9983    0.9867    0.3708	1.0000    0.9975    0.5667	1.0000    1.0000    0.6467	1.0000    1.0000    0.7650
1.0000    1.0000    0.3700	1.0000    1.0000    0.5800	1.0000    1.0000    0.6658	1.0000    1.0000    0.7708
];
CH_P2_Optimal=CH_P2(:,1:3:10);
CH_P2_Heuristic=CH_P2(:,2:3:11);
CH_P2_Random=CH_P2(:,3:3:12);
[DB_Optimal,DM_Optimal]=gradient(CH_P2_Optimal,spacing);
[DB_Huristic,DM_Huristic]=gradient(CH_P2_Heuristic,spacing);
[DB_Random,DM_Random]=gradient(CH_P2_Random,spacing);

figure(16);
hold on;
[C,h]=contour(Bandwidth,Memory,CH_P2_Optimal,'ShowText','on','LineWidth',curve_LineWidth);
v=[0.86,0.94,0.96,0.98,1];
clabel(C,h,v,'FontSize',lgd_FontSize,'FontWeight','bold','LabelSpacing',labelSpacing);
quiver(Bandwidth,Memory,DB_Optimal,DM_Optimal,'LineWidth',curve_LineWidth);
xlabel('Bandwidth (Gbps)');
ylabel('Caching Memory (GB)');
set(gca,'LineWidth',box_LineWidth,'FontName','Times New Roman',...
    'FontSize',box_FontSize,'FontWeight','bold');
grid minor;
box on;
axis equal;
hold off;

figure(17);
hold on;
[C,h]=contour(Bandwidth,Memory,CH_P2_Heuristic,'ShowText','on','LineWidth',curve_LineWidth);
v=0.8:0.05:1;
clabel(C,h,v,'FontSize',lgd_FontSize,'FontWeight','bold','LabelSpacing',labelSpacing);
quiver(Bandwidth,Memory,DB_Huristic,DM_Huristic,'LineWidth',curve_LineWidth);
xlabel('Bandwidth (Gbps)');
ylabel('Caching Memory (GB)');
set(gca,'LineWidth',box_LineWidth,'FontName','Times New Roman',...
    'FontSize',box_FontSize,'FontWeight','bold');
grid minor;
box on;
axis equal;
hold off;

figure(18);
hold on;
[C,h]=contour(Bandwidth,Memory,CH_P2_Random,'ShowText','on','LineWidth',curve_LineWidth);
v=0.45:0.1:0.75;
clabel(C,h,v,'FontSize',lgd_FontSize,'FontWeight','bold','LabelSpacing',labelSpacing);
quiver(Bandwidth,Memory,DB_Random,DM_Random,'LineWidth',curve_LineWidth);
xlabel('Bandwidth (Gbps)');
ylabel('Caching Memory (GB)');
set(gca,'LineWidth',box_LineWidth,'FontName','Times New Roman',...
    'FontSize',box_FontSize,'FontWeight','bold');
grid minor;
box on;
axis equal;
hold off;

%% Prediction Accuracy
acc=1:-0.1:0.2;

EG_P1=[
4.2364    3.9012    2.0890
2.8462    2.7001    1.8159
2.1037    2.0559    1.5405
1.7088    1.6555    1.3475
1.4393    1.4033    1.2015
1.2412    1.2206    1.1018
1.1009    1.0840    1.0118
0.9921    0.9785    0.9443
0.9026    0.8927    0.8916    
];

CH_P1=[
0.9942    0.9929    0.7486
0.8690    0.8703    0.6603
0.7607    0.7639    0.5857
0.6728    0.6710    0.5262
0.5938    0.5920    0.4706
0.5200    0.5189    0.4247
0.4513    0.4506    0.3783
0.3886    0.3864    0.3316
0.3223    0.3200    0.2884    
];

EG_P2=[
6.5038    5.1374    1.7105
4.5504    4.3918    1.5698
3.3520    3.2564    1.5221
2.6584    2.5942    1.4770
2.1736    2.1675    1.4359
1.8590    1.8477    1.3931
1.6172    1.6258    1.3489
1.4316    1.4244    1.2979
1.2871    1.2854    1.2456    
];

CH_P2=[
0.9967    0.9642    0.5725
0.9113    0.9130    0.5102
0.8300    0.8302    0.4850
0.7515    0.7485    0.4609
0.6664    0.6726    0.4396
0.5898    0.5905    0.4129
0.5084    0.5135    0.3839
0.4302    0.4291    0.3468
0.3487    0.3528    0.3081    
];

figure(19);
hold on;
for ii=1:3
    plot(acc,EG_P1(9:-1:1,ii),marker(ii),'LineWidth',curve_LineWidth,'MarkerSize',curve_MarkerSize);
end
hold off;
xlabel('User Perference Prediction Accuracy');
xticklabels({'100%','90%','80%','70%','60%','50%','40%','30%','20%'});
ylabel('Energy Gain');
ylim([0.8,4.5]);
set(gca,'LineWidth',box_LineWidth,'FontName','Times New Roman',...
    'FontSize',box_FontSize,'FontWeight','bold');
lgd=legend({'Optimal','GSAC','Random'},'Orientation','horizontal',...
    'Location','north','FontSize',lgd_FontSize);
grid minor;
box on;

figure(20);
H=bar(acc,CH_P1(9:-1:1,:),'grouped');
H(1).FaceColor='#bbbbbb';
H(2).FaceColor='#999999';
H(3).FaceColor='#666666';
ylim([0.2,1.1]);
xlabel('User Perference Prediction Accuracy');
xticklabels({'100%','90%','80%','70%','60%','50%','40%','30%','20%'});
ylabel('Cache-hit Ratio');
set(gca,'LineWidth',box_LineWidth,'FontName','Times New Roman',...
    'FontSize',box_FontSize,'FontWeight','bold');
lgd=legend({'Optimal','GSAC','Random'},'Orientation','horizontal',...
    'Location','north','FontSize',lgd_FontSize);
grid minor;
box on;


figure(21);
hold on;
for ii=1:3
    plot(acc,EG_P2(9:-1:1,ii),marker(ii),'LineWidth',curve_LineWidth,'MarkerSize',curve_MarkerSize);
end
hold off;
xlabel('User Perference Prediction Accuracy');
xticklabels({'100%','90%','80%','70%','60%','50%','40%','30%','20%'});
ylabel('Energy Gain');
ylim([1.2,6.8]);
set(gca,'LineWidth',box_LineWidth,'FontName','Times New Roman',...
    'FontSize',box_FontSize,'FontWeight','bold');
lgd=legend({'Optimal','GSAC','Random'},'Orientation','horizontal',...
    'Location','north','FontSize',lgd_FontSize);
grid minor;
box on;

figure(22);
H=bar(acc,CH_P2(9:-1:1,:),'grouped');
H(1).FaceColor='#bbbbbb';
H(2).FaceColor='#999999';
H(3).FaceColor='#666666';
ylim([0.2,1.1]);
xlabel('User Perference Prediction Accuracy');
xticklabels({'100%','90%','80%','70%','60%','50%','40%','30%','20%'});
ylabel('Cache-hit Ratio');
set(gca,'LineWidth',box_LineWidth,'FontName','Times New Roman',...
    'FontSize',box_FontSize,'FontWeight','bold');
lgd=legend({'Optimal','GSAC','Random'},'Orientation','horizontal',...
    'Location','north','FontSize',lgd_FontSize);
grid minor;
box on;

