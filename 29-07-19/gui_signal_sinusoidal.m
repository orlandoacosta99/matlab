function varargout = gui_signal_sinusoidal(varargin)
% GUI_SIGNAL_SINUSOIDAL MATLAB code for gui_signal_sinusoidal.fig
%      GUI_SIGNAL_SINUSOIDAL, by itself, creates a new GUI_SIGNAL_SINUSOIDAL or raises the existing
%      singleton*.
%
%      H = GUI_SIGNAL_SINUSOIDAL returns the handle to a new GUI_SIGNAL_SINUSOIDAL or the handle to
%      the existing singleton*.
%
%      GUI_SIGNAL_SINUSOIDAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_SIGNAL_SINUSOIDAL.M with the given input arguments.
%
%      GUI_SIGNAL_SINUSOIDAL('Property','Value',...) creates a new GUI_SIGNAL_SINUSOIDAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_signal_sinusoidal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_signal_sinusoidal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_signal_sinusoidal

% Last Modified by GUIDE v2.5 29-Jul-2019 19:57:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_signal_sinusoidal_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_signal_sinusoidal_OutputFcn, ...
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


% --- Executes just before gui_signal_sinusoidal is made visible.
function gui_signal_sinusoidal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_signal_sinusoidal (see VARARGIN)

% Choose default command line output for gui_signal_sinusoidal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_signal_sinusoidal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_signal_sinusoidal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Salir.
function Salir_Callback(hObject, eventdata, handles)
close


% --- Executes on button press in generar.
function generar_Callback(hObject, eventdata, handles)
clc
%--clear all--%
%--close all--%
%------- DATA IN -------%
A= str2num(get(handles.amplitud,'String'))
f = str2num(get(handles.frecuencia,'String'))
cantper = str2num(get(handles.periodo,'String'))
phi = pi;
phi1 = 0;
phi2 = pi/2;
phi3 = pi;
phi4 = 3*pi/2;


%------- PROCESS -------%

t = linspace(0,cantper*1/f,500);

xt1 = A*sin(2*pi*f*t + phi1);
xt2 = A*sin(2*pi*f*t + phi2);
xt3 = A*sin(2*pi*f*t + phi3);
xt4 = A*sin(2*pi*f*t + phi4);

%------- OUTPUT ------%

%--figure(1)--%
axes(handles.axes1)
plot(t,xt1),title('phi=0'),grid on

axes(handles.axes2)
plot(t,xt2),title('phi=pi/2'),grid on

axes(handles.axes3)
plot(t,xt3),title('phi=pi'),grid on

axes(handles.axes4)
plot(t,xt4),title('phi=3*pi/2'),grid on
% hObject    handle to generar (see GCBO)
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
