function varargout = untitled_test(varargin)
% UNTITLED_TEST MATLAB code for untitled_test.fig
%      UNTITLED_TEST, by itself, creates a new UNTITLED_TEST or raises the existing
%      singleton*.
%
%      H = UNTITLED_TEST returns the handle to a new UNTITLED_TEST or the handle to
%      the existing singleton*.
%
%      UNTITLED_TEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED_TEST.M with the given input arguments.
%
%      UNTITLED_TEST('Property','Value',...) creates a new UNTITLED_TEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_test_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_test_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled_test

% Last Modified by GUIDE v2.5 03-Aug-2021 15:11:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_test_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_test_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before untitled_test is made visible.
function untitled_test_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled_test (see VARARGIN)

% Choose default command line output for untitled_test
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled_test wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_test_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.slider1,'value');
data=handles.maxtrix;
[m,n]=size(data);
if n>2;
    datax=data(:,1);
    datay=data(:,2);
    [k,dist]=dsearchn(a,datax);
    index=find(dist==min(dist));
    datax2=data(:,3);
    datay2=data(:,4);
    [k2,dist2]=dsearchn(a,datax2);
    index2=find(dist2==min(dist2));
    displa1=strcat('X值:',num2str(datax(index)),',','左邊Y值:',num2str(datay(index)));
    displa2=strcat('X值:',num2str(datax(index)),',','右邊Y值:',num2str(datay2(index2)));
    displa={displa1,displa2};
    set(handles.listbox2,'String',displa);
    guidata(hObject,handles);
else
    datax=data(:,1);
    datay=data(:,2);
    [k,dist]=dsearchn(a,datax);
    index=find(dist==min(dist));
    displa={strcat('X值:',num2str(datax(index)),',','Y值:',num2str(datay(index)))};
    set(handles.listbox2,'String',displa);
    guidata(hObject,handles); 
end
axes(handles.axes1);
if isfield(handles,'myvline');
    delete(handles.myvline); 
end
handles.myvline = line([a a],ylim);
guidata(hObject,handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
list_val= get(hObject,'Value');
string_list = get(hObject,'String');
handles.string_list=string_list;
guidata(hObject,handles);
handles.list_val=list_val;
guidata(hObject,handles);
selected_string = string_list{list_val};
switch selected_string
    case'力量-半脫位'
        set(handles.text3,'visible','on');
        set(handles.text5,'visible','on');
        set(handles.pushbutton2,'visible','on');
        msgbox('          選擇半脫位檔案','完成！');
    case'力量(已處理)-半脫位'
        set(handles.text3,'visible','on');
        set(handles.text5,'visible','on');
        set(handles.pushbutton2,'visible','on');
        msgbox('          選擇半脫位檔案','完成！');
    case '力量-角度'
        set(handles.text3,'visible','on');
        set(handles.text5,'visible','on');
        set(handles.pushbutton2,'visible','on');
        msgbox('          選擇角度檔案','完成！');
    case '半脫位-角度'
        set(handles.text3,'visible','on');
        set(handles.text5,'visible','on');
        set(handles.pushbutton2,'visible','on');
        set(handles.pushbutton7,'visible','off');
        msgbox('          選擇角度檔案','完成！');
    case'時間-力量圖'
        set(handles.text3,'visible','off');
        set(handles.text5,'visible','off');
        set(handles.pushbutton2,'visible','off');
    case '計算半脫位'
        set(handles.text3,'visible','off');
        set(handles.text5,'visible','off');
        set(handles.pushbutton2,'visible','off');
        set(handles.pushbutton7,'visible','off');
    case '計算角度' 
        set(handles.text3,'visible','off');
        set(handles.text5,'visible','off');
        set(handles.pushbutton2,'visible','off');
        set(handles.pushbutton7,'visible','off');
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename filepath]=uigetfile({'*.txt';'*.xls';'*.xlsx';'*.csv';'*.*'},'請選擇文件文件')
set(handles.text4,'string',[filepath filename]);
str=[filepath filename];
filetype = filename(end-2:end);
switch filetype
    case 'txt'
        X=importdata([filepath '/' filename]);
        set(handles.uitable1,'data',X);
        handles.X=X;
        guidata(hObject, handles);
    case 'lsx'
        [X, title, raw]=xlsread(str);
        set(handles.uitable1,'ColumnName',raw(1,:),'data',raw(2:end,:));
        handles.X=X;
        guidata(hObject, handles);
        msgbox('          選擇動作','完成！');
    case 'xls'
        [X, title, raw]=xlsread(str);
        set(handles.uitable1,'ColumnName',raw(1,:),'data',raw(2:end,:));
        handles.X=X;
        guidata(hObject, handles);
        msgbox('          選擇動作','完成！');
    case 'csv'
        X=readmatrix(str);
        set(handles.uitable1,'data',X);
        handles.X=X;
        guidata(hObject, handles);
    otherwise
        msgbox('檔案格式錯誤, 請選擇 txt 檔或 xls 檔','File Open Error','error');
        return;
end


            

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename filepath]=uigetfile({'*.xlsx';'*.xls';'*.txt';'*.csv';'*.*'},'請選擇文件文件')
set(handles.text5,'string',[filepath filename]);
str=[filepath filename];
filetype = filename(end-2:end);
switch filetype
    case 'txt'
        data=importdata([filepath '/' filename]);
        set(handles.listbox2,'String',data);
    case 'lsx'
        [A, title, raw]=xlsread(str);
        set(handles.uitable1,'ColumnName',raw(1,:),'data',raw(2:end,:));
        handles.A=A;
        guidata(hObject, handles);
    case 'xls'
        [A, title, raw]=xlsread(str);
        set(handles.uitable1,'ColumnName',raw(1,:),'data',raw(2:end,:));
        handles.A=A;
        guidata(hObject, handles);
    case 'csv'
        A=readmatrix(str);
        set(handles.uitable1,'data',A);
        handles.A=A;
        guidata(hObject, handles);
    otherwise
        msgbox('檔案格式錯誤, 請選擇 txt 檔或 xls 檔','File Open Error','error');
        return;
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
string_list=handles.string_list;
list_val=handles.list_val;
selected_string = string_list{list_val};
switch selected_string
    case'時間-力量圖'
        cla(handles.axes1,'reset');
        set(handles.pushbutton7,'visible','on')
        X=handles.X;a=X(:,1);b=X(:,2);
        if a(1)>0
           a=a-a(1);
        end
        [t_MP,stress_MP]=tstr(a,b);
        title1={'時間','力量值'};
        max_stress=max(stress_MP)+5;
        maxtrix=[(t_MP)',stress_MP];
        set(handles.uitable1,'ColumnName',title1,'data',maxtrix);
        axes(handles.axes1);plot(t_MP,stress_MP);axis([0,15,0,max_stress]);
        xlabel(handles.axes1,'時間');ylabel(handles.axes1,'力量(N)');
        title('時間-力量圖');
        set(gca,'ytick',0:5:max_stress);
        set(gca,'xtick',0:1:15);
        msgbox('          數據已完成計算！','完成！');
    case '計算半脫位'
        cla(handles.axes1,'reset');
        X=handles.X;data=X(1:end,6:7);
        P=data(3:4:end,:);M1=data(1:4:end,:);M2=data(2:4:end,:);
        T1=data(4:4:end,:);n=fix(length(data)./4);
        for i=1:n;
            [dA,dB]=distanline2(P(i,:),M1(i,:),M2(i,:),T1(i,:));
            dC1=dA/(dA+dB)*100;i=i+1;d(i, :) = [dC1];D=double(d);
        end
        D(find(D==0))=[];
        D=roundn(D,-2);
        a=length(D)-1;
        t_mean=0:10:a*10;
        title1={'力量比值','脫位值'};
        max_D=max(D)+5;maxtrix=[(t_mean)',D];
        set(handles.uitable1,'ColumnName',title1,'data',maxtrix);
        axes(handles.axes1);plot(t_mean,D);axis([0,100,0,max_D]);
        xlabel(handles.axes1,'力量比值(%)');ylabel(handles.axes1,'脫位值(%)');
        title('力量比值-脫位值');
        set(gca,'ytick',0:5:max_D);
        set(gca,'xtick',0:10:100);
        msgbox('          數據已完成計算！','完成！');
    case '計算角度'
        cla(handles.axes1,'reset');
        X=handles.X;data=X(1:end,6:7);
        AM1=data(1:4:end,:);AM2=data(2:4:end,:);AP1=data(3:4:end,:);
        AP2=data(4:4:end,:);n=fix(length(data)./4);
        for i=1:n;
            [MP_angle1] = angle4P(AM1(i,:),AM2(i,:),AP1(i,:),AP2(i,:));
            MP_angle(i,:)=[MP_angle1];i=i+1
        end
        MP_angle(find(MP_angle==0))=[];
        MP_angle=roundn(MP_angle,-2);
        a=length(MP_angle)-1;
        t_mean=0:10:a*10;
        title1={'力量比值','角度'};
        max_MP_angle=max(MP_angle)+5;maxtrix=[(t_mean)',MP_angle];
        set(handles.uitable1,'ColumnName',title1,'data',maxtrix);
        axes(handles.axes1);plot(t_mean,MP_angle);axis([0,100,0,max_MP_angle]);
        xlabel(handles.axes1,'力量比值(%)');ylabel(handles.axes1,'角度');
        title('力量比值-角度');
        set(gca,'ytick',0:5:max_MP_angle);
        set(gca,'xtick',0:10:100);
        msgbox('          數據已完成計算！','完成！');
    case '力量-半脫位'
        cla(handles.axes1,'reset');
        set(handles.pushbutton7,'visible','on');
        X=handles.X;a=X(:,1);b=X(:,2);
        if a(1)>0
           a=a-a(1);
        end
        [t_MP,stress_MP]=tstr(a,b);
        Y=F_ST(t_MP,stress_MP);
        max_stress=max(stress_MP)+5;
        A=handles.A;dataA=A(1:end,6:7);
        P=dataA(3:4:end,:);M1=dataA(1:4:end,:);M2=dataA(2:4:end,:);
        T1=dataA(4:4:end,:);nA=fix(length(dataA)./4);
        for i=1:nA;
            [dA,dB]=distanline2(P(i,:),M1(i,:),M2(i,:),T1(i,:));
            dC=dA/(dA+dB)*100;i=i+1;d(i, :) = [dC];D=double(d);
        end
        D(find(D==0))=[];
        D=roundn(D,-2);
        max_D=max(D)+5;
        t_mean=roundn(Y(:,2),-2);
        FT=Y(:,1);
        F=roundn(Y(:,3),-2);
        title1={'時間','力量值','力量比值','力量值','脫位計算時間','脫位值'};
        maxtrix=zeros(length(stress_MP),6);
        maxtrix(1:length(t_MP),1)=(t_MP)';
        maxtrix(1:length(stress_MP),2)=stress_MP;
        maxtrix(1:length(FT),3)=FT;
        maxtrix(1:length(F),4)=F;
        maxtrix(1:length(t_mean),5)=(t_mean)';
        maxtrix(1:length(D),6)=D;
        set(handles.uitable1,'ColumnName',title1,'data',maxtrix);
        axes(handles.axes1);
        yyaxis left
        plot(t_MP,stress_MP,'b');
        ylabel('Force(N)');axis([0,15,0,max_stress]);
        set(gca,'ytick',0:5:max_stress);
        yyaxis right
        plot(t_mean,D,'k');axis([0,15,0,max_D]);
        set(gca,'ytick',0:5:max_D);
        set(gca,'xtick',0:1:15);
        ylabel('Subluxation');
        xlabel('時間');
        title('力量-脫位值');
        msgbox('          數據已完成計算！','完成！');
    case '力量-角度'
        cla(handles.axes1,'reset');
        set(handles.pushbutton7,'visible','on');
        X=handles.X;a=X(:,1);b=X(:,2);
        [t_MP,stress_MP]=tstr(a,b);
        Y=F_ST(t_MP,stress_MP);
        max_stress=max(stress_MP)+5;
        A=handles.A;data=A(1:end,6:7);
        AM1=data(1:4:end,:);AM2=data(2:4:end,:);AP1=data(3:4:end,:);
        AP2=data(4:4:end,:);n=fix(length(data)./4);
        for i=1:n;
            [MP_angle1] = angle4P(AM1(i,:),AM2(i,:),AP1(i,:),AP2(i,:));
            MP_angle(i,:)=[MP_angle1];i=i+1;
        end
        MP_angle(find(MP_angle==0))=[];
        MP_angle=roundn(MP_angle,-2);
        t_mean=roundn(Y(:,2),-2);
        max_MP_angle=max(MP_angle)+5;
        FT=Y(:,1);
        F=roundn(Y(:,3),-2);
        title1={'時間','力量值','力量比值','力量值','角度計算時間','角度'};
        maxtrix=zeros(length(stress_MP),6);
        maxtrix(1:length(t_MP),1)=(t_MP)';
        maxtrix(1:length(stress_MP),2)=stress_MP;
        maxtrix(1:length(FT),3)=FT;
        maxtrix(1:length(F),4)=F;
        maxtrix(1:length(t_mean),5)=(t_mean)';
        maxtrix(1:length(MP_angleM),6)=MP_angleM;
        set(handles.uitable1,'ColumnName',title1,'data',maxtrix);
        axes(handles.axes1);
        yyaxis left
        plot(t_MP,stress_MP,'b');
        ylabel('Force(N)');axis([0,15,0,max_stress]);
        set(gca,'ytick',0:5:max_stress);
        yyaxis right
        plot(t_mean,MP_angle,'k');axis([0,15,0,max_MP_angle]);
        set(gca,'ytick',0:5:max_MP_angle);
        set(gca,'xtick',0:1:15);
        ylabel('角度');
        xlabel('時間');
        title('力量-角度值');
        msgbox('          數據已完成計算！','完成！');
    case '半脫位-角度'
        cla(handles.axes1,'reset');
        X=handles.X;data=X(1:end,6:7);
        P=data(3:4:end,:);M1=data(1:4:end,:);M2=data(2:4:end,:);
        T1=data(4:4:end,:);n=fix(length(data)./4);
        for i=1:n;
            [dA,dB]=distanline2(P(i,:),M1(i,:),M2(i,:),T1(i,:));
            dC=dA/(dA+dB)*100;i=i+1;d(i, :) = [dC];D=double(d);
        end
        D(find(D==0))=[];
        D=roundn(D,-2);
        a=length(D)-1;
        t_mean=0:10:a*10;
        max_D=max(D)+5;
        A=handles.A;dataA=A(1:end,6:7);
        AM1=dataA(1:4:end,:);AM2=dataA(2:4:end,:);AP1=dataA(3:4:end,:);
        AP2=dataA(4:4:end,:);nA=fix(length(dataA)./4);
        for i=1:nA;
            [MP_angle1] = angle4P(AM1(i,:),AM2(i,:),AP1(i,:),AP2(i,:));
            MP_angle(i,:)=[MP_angle1];i=i+1
        end
        MP_angle(find(MP_angle==0))=[];
        MP_angle=roundn(MP_angle,-2);
        max_MP_angle=max(MP_angle)+5;
        title1={'力量比值','脫位值','力量比值','角度'};
        maxtrix=[(t_mean)',D,(t_mean)',MP_angle];
        set(handles.uitable1,'ColumnName',title1,'data',maxtrix);
        axes(handles.axes1);
        yyaxis left
        plot(t_mean,D,'b');
        ylabel('Subluxation(%)');axis([0,100,0,max_D]);
        set(gca,'ytick',0:5:max_DM);
        yyaxis right
        plot(t_mean,MP_angle,'k');axis([0,100,0,max_MP_angle]);
        set(gca,'ytick',0:5:max_MP_angle);
        set(gca,'xtick',0:10:100);
        ylabel('角度');
        xlabel('時間');
        title('半脫位-角度值');
        msgbox('          數據已完成計算！','完成！');
    case'力量(已處理)-半脫位'
        cla(handles.axes1,'reset');
        set(handles.pushbutton7,'visible','on');
        X=handles.X;t_MP=X(:,1);stress_MP=X(:,2);
        Y=F_ST(t_MP,stress_MP);
        max_stress=max(stress_MP)+5;
        A=handles.A;dataA=A(1:end,6:7);
        P=dataA(3:4:end,:);M1=dataA(1:4:end,:);M2=dataA(2:4:end,:);
        T1=dataA(4:4:end,:);nA=fix(length(dataA)./4);
        for i=1:nA;
            [dA,dB]=distanline2(P(i,:),M1(i,:),M2(i,:),T1(i,:));
            dC=dA/(dA+dB)*100;i=i+1;d(i, :) = [dC];D=double(d);
        end
        D(find(D==0))=[];
        D=roundn(D,-2);
        max_D=max(D)+5;
        t_mean=roundn(Y(:,2),-2);
        FT=Y(:,1);
        F=roundn(Y(:,3),-2);
        title1={'時間','力量值','力量比值','力量值','脫位計算時間','脫位值'};
        maxtrix=zeros(length(stress_MP),6);
        maxtrix(1:length(t_MP),1)=t_MP;
        maxtrix(1:length(stress_MP),2)=stress_MP;
        maxtrix(1:length(FT),3)=FT;
        maxtrix(1:length(F),4)=F;
        maxtrix(1:length(t_mean),5)=(t_mean)';
        maxtrix(1:length(D),6)=D;
        set(handles.uitable1,'ColumnName',title1,'data',maxtrix);
        axes(handles.axes1);
        yyaxis left
        plot(t_MP,stress_MP,'b');
        ylabel('Force(N)');axis([0,15,0,max_stress]);
        set(gca,'ytick',0:5:max_stress);
        yyaxis right
        plot(t_mean,D,'k');axis([0,15,0,max_D]);
        set(gca,'ytick',0:5:max_D);
        set(gca,'xtick',0:1:15);
        ylabel('Subluxation');
        xlabel('時間');
        title('力量-脫位值');
        msgbox('          數據已完成計算！','完成！');
    case'時間-力量圖(已處理)'
        cla(handles.axes1,'reset');
        set(handles.pushbutton7,'visible','on')
        X=handles.X;t_MP=X(:,1);stress_MP=X(:,2);
        title1={'時間','力量值'};
        max_stress=max(stress_MP)+5;
        maxtrix=[t_MP,stress_MP];
        set(handles.uitable1,'ColumnName',title1,'data',maxtrix);
        axes(handles.axes1);plot(t_MP,stress_MP);axis([0,15,0,max_stress]);
        xlabel(handles.axes1,'時間');ylabel(handles.axes1,'力量(N)');
        title('時間-力量圖');
        set(gca,'ytick',0:5:max_stress);
        set(gca,'xtick',0:1:15);
        msgbox('          數據已完成計算！','完成！');
        
    otherwise
        msgbox('檔案缺少, 請選擇正確動作及資料','File Open Error','error');
        return;
end
handles.title1=title1;
guidata(hObject,handles);
handles.maxtrix=maxtrix;
guidata(hObject, handles);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
new_f_handle=figure('visible','off');
new_axes=copyobj(handles.axes1,new_f_handle); 
set(new_axes,'Units','normalized','Position',[0.1 0.1 0.8 0.8]);
[filename pathname fileindex]=uiputfile({'*.png';'*.bmp';'*.jpg';'*.eps';},'圖片保存為');
    if  filename~=0
        file=strcat(pathname,filename);
        switch fileindex         
            case 1
                print(new_f_handle,'-dpng',file);
                fprintf('>>已保存到：%s\n',file);
            case 2
                print(new_f_handle,'-dbmp',file);
                fprintf('>>已保存到：%s\n',file);
            case 3
                print(new_f_handle,'-djpeg',file);
                fprintf('>>已保存到：%s\n',file);
            case 4
                print(new_f_handle,'-depsc',file);
                fprintf('>>已保存到：%s\n',file);
        end 
        msgbox('          圖片已成功保存！','完成！');
    end
    delete(new_f_handle);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
exit=questdlg('關閉程式?','NTPUstat','YES','NO','NO');
if strcmp(exit, 'YES')
close(gcf)
end

% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data=get(handles.uitable1,'Data');
ht=handles.title1;
[filename,pathname]=uiputfile({'*.xlsx'},'導出數據','result');
xlswrite(fullfile(pathname,filename),ht,1,'A1');
xlswrite(fullfile(pathname,filename),data,1,'A2');
msgbox('          表格已成功保存！','完成！');


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
string_list=handles.string_list;
list_val=handles.list_val;
selected_string = string_list{list_val};
switch selected_string
    case'力量(已處理)-半脫位'
        X=handles.X;t_MP=X(:,1);stress_MP=X(:,2);
        [Ft_max,Ft_75,Ft_50,Ft_25]=Ft(t_MP,stress_MP);
        axes(handles.axes1);
        hold on
        plot([Ft_max,Ft_max],ylim,'m-.');
        plot([Ft_75,Ft_75],ylim,'g-.');
        plot([Ft_50,Ft_50],ylim,'c-.');
        plot([Ft_25,Ft_25],ylim,'r-.');
        [F_max,F_75,F_50,F_25]=F_S(t_MP,stress_MP)
        str1=strcat('max值:',num2str(F_max));
        str2=strcat('75%值:',num2str(F_75));
        str3=strcat('50%值:',num2str(F_50));
        str4=strcat('25%值:',num2str(F_25));
        str={str1;str2;str3;str4};
        set(handles.listbox2,'String',str);
    case '時間-力量圖(已處理)'
        X=handles.X;t_MP=X(:,1);stress_MP=X(:,2);
        [Ft_max,Ft_75,Ft_50,Ft_25]=Ft(t_MP,stress_MP);
        axes(handles.axes1);
        hold on
        plot([Ft_max,Ft_max],ylim,'m-.');
        plot([Ft_75,Ft_75],ylim,'g-.');
        plot([Ft_50,Ft_50],ylim,'c-.');
        plot([Ft_25,Ft_25],ylim,'r-.');
        [F_max,F_75,F_50,F_25]=F_S(t_MP,stress_MP)
        str1=strcat('max值:',num2str(F_max));
        str2=strcat('75%值:',num2str(F_75));
        str3=strcat('50%值:',num2str(F_50));
        str4=strcat('25%值:',num2str(F_25));
        str={str1;str2;str3;str4};
        set(handles.listbox2,'String',str);
    otherwise
        X=handles.X;a=X(:,1);b=X(:,2);
        [t_MP,stress_MP]=tstr(a,b);
        [Ft_max,Ft_75,Ft_50,Ft_25]=Ft(t_MP,stress_MP);
        axes(handles.axes1);
        hold on
        plot([Ft_max,Ft_max],ylim,'m-.');
        plot([Ft_75,Ft_75],ylim,'g-.');
        plot([Ft_50,Ft_50],ylim,'c-.');
        plot([Ft_25,Ft_25],ylim,'r-.');
        [F_max,F_75,F_50,F_25]=F_S(t_MP,stress_MP)
        str1=strcat('max值:',num2str(F_max));
        str2=strcat('75%值:',num2str(F_75));
        str3=strcat('50%值:',num2str(F_50));
        str4=strcat('25%值:',num2str(F_25));
        str={str1;str2;str3;str4};
        set(handles.listbox2,'String',str);
end
