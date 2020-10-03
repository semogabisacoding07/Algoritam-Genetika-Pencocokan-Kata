function varargout = pencocokan_kata_gui(varargin)
% PENCOCOKAN_KATA_GUI MATLAB code for pencocokan_kata_gui.fig
%      PENCOCOKAN_KATA_GUI, by itself, creates a new PENCOCOKAN_KATA_GUI or raises the existing
%      singleton*.
%
%      H = PENCOCOKAN_KATA_GUI returns the handle to a new PENCOCOKAN_KATA_GUI or the handle to
%      the existing singleton*.
%
%      PENCOCOKAN_KATA_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PENCOCOKAN_KATA_GUI.M with the given input arguments.
%
%      PENCOCOKAN_KATA_GUI('Property','Value',...) creates a new PENCOCOKAN_KATA_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pencocokan_kata_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pencocokan_kata_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pencocokan_kata_gui

% Last Modified by GUIDE v2.5 30-May-2020 04:19:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pencocokan_kata_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @pencocokan_kata_gui_OutputFcn, ...
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


% --- Executes just before pencocokan_kata_gui is made visible.
function pencocokan_kata_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pencocokan_kata_gui (see VARARGIN)

% Choose default command line output for pencocokan_kata_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pencocokan_kata_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pencocokan_kata_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
target = get(handles.edit1, 'string');
jumlah_populasi = str2double(get(handles.edit2, 'string'));
mutation_rate = str2double(get(handles.edit3, 'string'));
%GA(target,jumlah_populasi,mutation_rate);
population = create_population(target, jumlah_populasi);
islooping = true;
generation = 0;
while islooping
    % evaluation
    islooping = evaluation(population);
    % display
     clc
    proses = selection(population);
    fprintf('target : %s \n',target);
    fprintf('proses : %s \n',proses.genes);
    fprintf('\n')
    fprintf('generation: %d \n', generation);
    fprintf('\n');
    
    for i=1:length(population)
        fprintf('genes: %s ',population(i).genes);
        fprintf('Fitness: %.2f ',population(i).fitness);
        fprintf('\n');
    end
    
    set(handles.text3, 'string', proses.genes);
    set(handles.text8, 'string', generation);
    for i=1:length(population)
        set(handles.text10, 'string', population(i).fitness);
    end
    % selection
    [parent1,parent2] = selection(population);
    % crossover
    [child1,child2] = crossover(parent1,parent2);
    % mutation
    mutant1 = mutation(child1, mutation_rate);
    mutant2 = mutation(child2, mutation_rate);
    % hitung fitness mutant
    mutant1.fitness = calculate_fitness(mutant1.genes,target);
    mutant2.fitness = calculate_fitness(mutant2.genes,target);
    % membuat new generation
    children = [mutant1 mutant2];
    population = regeneration(children,population);
    generation = generation + 1;
end 
%set(handles.text3, 'string', proses.genes);

