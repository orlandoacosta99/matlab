function varargout = gui_transformada_fourier(varargin)
% GUI_TRANSFORMADA_FOURIER MATLAB code for gui_transformada_fourier.fig
%      GUI_TRANSFORMADA_FOURIER, by itself, creates a new GUI_TRANSFORMADA_FOURIER or raises the existing
%      singleton*.
%
%      H = GUI_TRANSFORMADA_FOURIER returns the handle to a new GUI_TRANSFORMADA_FOURIER or the handle to
%      the existing singleton*.
%
%      GUI_TRANSFORMADA_FOURIER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_TRANSFORMADA_FOURIER.M with the given input arguments.
%
%      GUI_TRANSFORMADA_FOURIER('Property','Value',...) creates a new GUI_TRANSFORMADA_FOURIER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_transformada_fourier_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_transformada_fourier_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_transformada_fourier

% Last Modified by GUIDE v2.5 09-Aug-2019 22:51:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_transformada_fourier_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_transformada_fourier_OutputFcn, ...
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


% --- Executes just before gui_transformada_fourier is made visible.
function gui_transformada_fourier_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_transformada_fourier (see VARARGIN)

% Choose default command line output for gui_transformada_fourier
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_transformada_fourier wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_transformada_fourier_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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



function periodo_Callback(hObject, eventdata, handles)
% hObject    handle to periodo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of periodo as text
%        str2double(get(hObject,'String')) returns contents of periodo as a double


% --- Executes during object creation, after setting all properties.
function periodo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to periodo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in push_Generar.
function push_Generar_Callback(hObject, eventdata, handles)
clc
%------- DATA IN -------%
A= str2num(get(handles.amplitud,'String'))
f = str2num(get(handles.frecuencia,'String'))
cantper = str2num(get(handles.periodo,'String'))


%------- PROCESS -------%

t = linspace(0,cantper/f,500);
xt_1cf = (A/1)*sin(2*pi*1*f*t);
xt_2cf = xt_1cf + (A/3)*sin(2*pi*3*f*t);
xt_3cf = xt_2cf + (A/5)*sin(2*pi*5*f*t);
xt_4cf = xt_3cf + (A/7)*sin(2*pi*7*f*t);
xt_5cf = xt_4cf + (A/9)*sin(2*pi*9*f*t);
xt_6cf = xt_5cf + (A/11)*sin(2*pi*11*f*t);

tf_1cf = abs(fft(xt_1cf));
tf_2cf = abs(fft(xt_2cf));
tf_3cf = abs(fft(xt_3cf));
tf_4cf = abs(fft(xt_4cf));
tf_5cf = abs(fft(xt_5cf));
tf_6cf = abs(fft(xt_6cf));

%------- OUTPUT ------%

%--figure(1)--%

axes(handles.axes1)
plot(t,xt_1cf),title('componentes de frecuencia: 1'),grid on

axes(handles.axes2)
plot(t,xt_2cf),title('componentes de frecuencia: 2'),grid on

axes(handles.axes3)
plot(t,xt_3cf),title('componentes de frecuencia: 3'),grid on

axes(handles.axes4)
plot(t,xt_4cf),title('componentes de frecuencia: 4'),grid on

axes(handles.axes5)
plot(t,xt_5cf),title('componentes de frecuencia: 5'),grid on

axes(handles.axes6)
plot(t,xt_6cf),title('componentes de frecuencia: 6'),grid on

%--figure(2)--%

axes(handles.axes7)
plot(tf_1cf(1:15)),title('T.F componentes de frecuencia: 1'),grid on

axes(handles.axes8)
plot(tf_2cf(1:15)),title('T.F componentes de frecuencia: 2'),grid on

axes(handles.axes9)
plot(tf_3cf(1:15)),title('T.F componentes de frecuencia: 3'),grid on

axes(handles.axes10)
plot(tf_4cf(1:15)),title('T.F componentes de frecuencia: 4'),grid on

axes(handles.axes11)
plot(tf_5cf(1:15)),title('T.F componentes de frecuencia: 5'),grid on

axes(handles.axes12)
plot(tf_6cf(1:15)),title('T.F componentes de frecuencia: 6'),grid on


% hObject    handle to push_Generar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in push_Limpiar.
function push_Limpiar_Callback(hObject, eventdata, handles)
axes(handles.axes1)
cla
axes(handles.axes2)
cla
axes(handles.axes3)
cla
axes(handles.axes4)
cla
axes(handles.axes5)
cla
axes(handles.axes6)
cla
axes(handles.axes7)
cla
axes(handles.axes8)
cla
axes(handles.axes9)
cla
axes(handles.axes10)
cla
axes(handles.axes11)
cla
axes(handles.axes12)
cla
% hObject    handle to push_Limpiar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in push_Salir.
function push_Salir_Callback(hObject, eventdata, handles)
close
% hObject    handle to push_Salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
