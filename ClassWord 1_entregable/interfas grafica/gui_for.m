function varargout = gui_for(varargin)
% GUI_FOR MATLAB code for gui_for.fig
%      GUI_FOR, by itself, creates a new GUI_FOR or raises the existing
%      singleton*.
%
%      H = GUI_FOR returns the handle to a new GUI_FOR or the handle to
%      the existing singleton*.
%
%      GUI_FOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_FOR.M with the given input arguments.
%
%      GUI_FOR('Property','Value',...) creates a new GUI_FOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_for_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_for_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_for

% Last Modified by GUIDE v2.5 12-Aug-2019 00:04:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_for_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_for_OutputFcn, ...
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


% --- Executes just before gui_for is made visible.
function gui_for_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_for (see VARARGIN)

% Choose default command line output for gui_for
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_for wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_for_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Generar.
function Generar_Callback(hObject, eventdata, handles)
clc
%------- DATA IN -------%
A = str2num(get(handles.amplitud,'String'))
f = str2num(get(handles.frecuencia,'String'))
cantper = str2num(get(handles.periodo,'String'))
comp_freq = str2num(get(handles.com_frequencia,'String'))
phi = str2num(get(handles.pi,'String'))
%-- PROCESS--%
t=linspace(0,cantper/f,500);

%señal sinusoidal basica
sinusoidal = A*sin(2*pi*f*t + phi);

%Señal cuadrada
cuadrada =0;
for n=1:2:(2*comp_freq-1) %comience en n=1 con pasos de :2: 
    cuadrada = cuadrada +(A/n)*sin(2*pi*f*n*t);
end

%Señal triangular
triangular =0;
for n=1:2:(2*comp_freq-1) %comience en n=1 con pasos de :2: 
    triangular = triangular +(A/n^2)*cos(2*pi*f*n*t);
end

%Señal diente sierra
dsierra =0;
for n=1:comp_freq %comience en n=1 con pasos de :1:
    if(mod(n,2) ==0)
        signo=-1;
    else
        signo=1;
    end
    dsierra = dsierra + signo*(A/n)*sin(2*pi*f*n*t);
end
%------- OUTPUT ------%
axes(handles.axes1)
plot(t,sinusoidal),title('Sinusoidal'),grid on
axes(handles.axes2)
plot(t,cuadrada),title('Cuadrada'),grid on
axes(handles.axes3)
plot(t,triangular),title('Triangular'),grid on
axes(handles.axes4)
plot(t,dsierra),title('Diente Sierra'),grid on
% hObject    handle to Generar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Limpiar.
function Limpiar_Callback(hObject, eventdata, handles)
axes(handles.axes1)
cla
axes(handles.axes2)
cla
axes(handles.axes3)
cla
axes(handles.axes4)
cla
% hObject    handle to Limpiar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Salir.
function Salir_Callback(hObject, eventdata, handles)
close
% hObject    handle to Salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function amplitud_Callback(hObject, eventdata, handles)
% hObject    handle to amplitud (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amplitud as text
%        str2double(get(hObject,'String')) returns contents of amplitud as a double


% --- Executes during object creation, after setting all properties.
function amplitud_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amplitud (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function frecuencia_Callback(hObject, eventdata, handles)
% hObject    handle to frecuencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frecuencia as text
%        str2double(get(hObject,'String')) returns contents of frecuencia as a double


% --- Executes during object creation, after setting all properties.
function frecuencia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frecuencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to com_frequencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of com_frequencia as text
%        str2double(get(hObject,'String')) returns contents of com_frequencia as a double


% --- Executes during object creation, after setting all properties.
function periodo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to com_frequencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function com_frequencia_Callback(hObject, eventdata, handles)
% hObject    handle to text6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text6 as text
%        str2double(get(hObject,'String')) returns contents of text6 as a double
% --- Executes on selection change in selector.
% --- Executes during object creation, after setting all properties.
function com_frequencia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to com_frequencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pi_Callback(hObject, eventdata, handles)
% hObject    handle to pi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pi as text
%        str2double(get(hObject,'String')) returns contents of pi as a double


% --- Executes during object creation, after setting all properties.
function pi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
