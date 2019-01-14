% *************************************************************************
% Program: get_pref_MW.m
% 
% Coverts all mag types to MW and selects preferred MW
% 
% zone = 1 > WA
% zone = 2 > EA
% zone = 3 > SA
%
% Author: T. Allen (2011-01-11)
% *************************************************************************

% load data

if exist('mdat','var') ~= 1
    disp('Loading mdat');
    load mdat_mw_pref.mat;
end
header = 'DATESTR,DATENUM,TYPE,DEPENDENCE,LON,LAT,DEP,LOCSRC,PREFMW,PREFMWSRC,PREFMS,PREFMSSRC,PREFmb,PREFmbSRC,PREFML,PREFMLSRC,MLREG,REVML,MX_ORIGML,MX_TYPE,MX_REVML,MX_REVMLTYPE,MX_REVMLSRC,MS2MW,mb2MW,ML2MW,PREFMW,PREFMWSRC,COMM';
disp('writing to file')


%% write ML-MW to file

outfile = fullfile('..','data','NSHA18CAT.ML-MW.csv');
idx = find(~isnan([mdat.MDAT_prefML]) & ~isnan([mdat.MDAT_prefMW]));
magdat = mdat(idx);

dlmwrite(outfile,header,'delimiter','');
txt = [];
for i = 1:length(magdat)
    comms = ['"',magdat(i).GG_place,'"'];
    
    % set mlregion
    if magdat(i).zone == 1
        mlreg = 'WA';
    elseif magdat(i).zone == 2
        mlreg = 'SEA';
    elseif magdat(i).zone == 3
        mlreg = 'SA';
    elseif magdat(i).zone == 4
        mlreg = 'Other';
    end
    
    line = [datestr(magdat(i).MDAT_dateNum,31),',',num2str(magdat(i).MDAT_dateNum),',', ...
            magdat(i).GG_sourceType,',',num2str(magdat(i).GG_dependence),',', ...
            num2str(magdat(i).MDAT_lon),',', ...
            num2str(magdat(i).MDAT_lat),',',num2str(magdat(i).MDAT_dep),',', ...
            magdat(i).MDAT_locsrc,',', ...
            num2str(magdat(i).MDAT_prefMW),',',magdat(i).MDAT_prefMWSrc,',', ...
            num2str(magdat(i).MDAT_prefMS),',',magdat(i).MDAT_prefMSSrc,',', ...
            num2str(magdat(i).MDAT_prefmb),',',magdat(i).MDAT_prefmbSrc,',', ...
            num2str(magdat(i).MDAT_prefML),',',magdat(i).MDAT_prefMLSrc,',', mlreg,',', ...
            num2str(magdat(i).MDAT_MLrev,'%0.2f'),',',num2str(magdat(i).Mx_OrigML,'%0.2f'),',', ...
            magdat(i).MDAT_origMagType,',', ...
            num2str(magdat(i).Mx_RevML,'%0.2f'),',',magdat(i).Mx_RevMLtype,',', ...
            magdat(i).Mx_RevMLSrc,',', ...
            num2str(magdat(i).MS2MW,'%0.2f'),',',num2str(magdat(i).mb2MW,'%0.2f'),',', ...
            num2str(magdat(i).ML2MWG,'%0.2f'),',', ...
            num2str(magdat(i).prefFinalMW,'%0.2f'),',', ...
            magdat(i).prefFinalMWSrc,',',comms,char(10)];
    txt = [txt line];
end

dlmwrite(outfile,txt,'delimiter','','-append');

%% write MS-MW to file

outfile = fullfile('..','data','NSHA18CAT.MS-MW.csv');
idx = find(~isnan([mdat.MDAT_prefMS]) & ~isnan([mdat.MDAT_prefMW]));
magdat = mdat(idx);

dlmwrite(outfile,header,'delimiter','');
txt = [];
for i = 1:length(magdat)
    comms = ['"',magdat(i).GG_place,'"'];
    
    % set mlregion
    if magdat(i).zone == 1
        mlreg = 'WA';
    elseif magdat(i).zone == 2
        mlreg = 'SEA';
    elseif magdat(i).zone == 3
        mlreg = 'SA';
    elseif magdat(i).zone == 4
        mlreg = 'Other';
    end
    
    line = [datestr(magdat(i).MDAT_dateNum,31),',',num2str(magdat(i).MDAT_dateNum),',', ...
            magdat(i).GG_sourceType,',',num2str(magdat(i).GG_dependence),',', ...
            num2str(magdat(i).MDAT_lon),',', ...
            num2str(magdat(i).MDAT_lat),',',num2str(magdat(i).MDAT_dep),',', ...
            magdat(i).MDAT_locsrc,',', ...
            num2str(magdat(i).MDAT_prefMW),',',magdat(i).MDAT_prefMWSrc,',', ...
            num2str(magdat(i).MDAT_prefMS),',',magdat(i).MDAT_prefMSSrc,',', ...
            num2str(magdat(i).MDAT_prefmb),',',magdat(i).MDAT_prefmbSrc,',', ...
            num2str(magdat(i).MDAT_prefML),',',magdat(i).MDAT_prefMLSrc,',', mlreg,',', ...
            num2str(magdat(i).MDAT_MLrev,'%0.2f'),',',num2str(magdat(i).Mx_OrigML,'%0.2f'),',', ...
            magdat(i).MDAT_origMagType,',', ...
            num2str(magdat(i).Mx_RevML,'%0.2f'),',',magdat(i).Mx_RevMLtype,',', ...
            magdat(i).Mx_RevMLSrc,',', ...
            num2str(magdat(i).MS2MW,'%0.2f'),',',num2str(magdat(i).mb2MW,'%0.2f'),',', ...
            num2str(magdat(i).ML2MWG,'%0.2f'),',', ...
            num2str(magdat(i).prefFinalMW,'%0.2f'),',', ...
            magdat(i).prefFinalMWSrc,',',comms,char(10)];
    txt = [txt line];
end

dlmwrite(outfile,txt,'delimiter','','-append');

%% write mb-MW to file

outfile = fullfile('..','data','NSHA18CAT.mb-MW.csv');
idx = find(~isnan([mdat.MDAT_prefmb]) & ~isnan([mdat.MDAT_prefMW]));
magdat = mdat(idx);

dlmwrite(outfile,header,'delimiter','');
txt = [];
for i = 1:length(magdat)
    comms = ['"',magdat(i).GG_place,'"'];
    
    % set mlregion
    if magdat(i).zone == 1
        mlreg = 'WA';
    elseif magdat(i).zone == 2
        mlreg = 'SEA';
    elseif magdat(i).zone == 3
        mlreg = 'SA';
    elseif magdat(i).zone == 4
        mlreg = 'Other';
    end
    
    line = [datestr(magdat(i).MDAT_dateNum,31),',',num2str(magdat(i).MDAT_dateNum),',', ...
            magdat(i).GG_sourceType,',',num2str(magdat(i).GG_dependence),',', ...
            num2str(magdat(i).MDAT_lon),',', ...
            num2str(magdat(i).MDAT_lat),',',num2str(magdat(i).MDAT_dep),',', ...
            magdat(i).MDAT_locsrc,',', ...
            num2str(magdat(i).MDAT_prefMW),',',magdat(i).MDAT_prefMWSrc,',', ...
            num2str(magdat(i).MDAT_prefMS),',',magdat(i).MDAT_prefMSSrc,',', ...
            num2str(magdat(i).MDAT_prefmb),',',magdat(i).MDAT_prefmbSrc,',', ...
            num2str(magdat(i).MDAT_prefML),',',magdat(i).MDAT_prefMLSrc,',', mlreg,',', ...
            num2str(magdat(i).MDAT_MLrev,'%0.2f'),',',num2str(magdat(i).Mx_OrigML,'%0.2f'),',', ...
            magdat(i).MDAT_origMagType,',', ...
            num2str(magdat(i).Mx_RevML,'%0.2f'),',',magdat(i).Mx_RevMLtype,',', ...
            magdat(i).Mx_RevMLSrc,',', ...
            num2str(magdat(i).MS2MW,'%0.2f'),',',num2str(magdat(i).mb2MW,'%0.2f'),',', ...
            num2str(magdat(i).ML2MWG,'%0.2f'),',', ...
            num2str(magdat(i).prefFinalMW,'%0.2f'),',', ...
            magdat(i).prefFinalMWSrc,',',comms,char(10)];
    txt = [txt line];
end

dlmwrite(outfile,txt,'delimiter','','-append');

%% write mb-ML to file

outfile = fullfile('..','data','NSHA18CAT.mb-ML.csv');

years = [];
for i = 1:length(mdat)
   years = [years str2double(datestr(mdat(i).MDAT_dateNum, 'yyyy'))];
end

idx = find(~isnan([mdat.MDAT_prefmb]) & ~isnan([mdat.MDAT_prefML]) ...
           & [mdat.MDAT_prefmb] > 0. & years >= 1990);
magdat = mdat(idx);

dlmwrite(outfile,header,'delimiter','');
txt = [];
for i = 1:length(magdat)
    comms = ['"',magdat(i).GG_place,'"'];
    
    % set mlregion
    if magdat(i).zone == 1
        mlreg = 'WA';
    elseif magdat(i).zone == 2
        mlreg = 'SEA';
    elseif magdat(i).zone == 3
        mlreg = 'SA';
    elseif magdat(i).zone == 4
        mlreg = 'Other';
    end
    
    if  magdat(i).zone ~= 4
        line = [datestr(magdat(i).MDAT_dateNum,31),',',num2str(magdat(i).MDAT_dateNum),',', ...
                magdat(i).GG_sourceType,',',num2str(magdat(i).GG_dependence),',', ...
                num2str(magdat(i).MDAT_lon),',', ...
                num2str(magdat(i).MDAT_lat),',',num2str(magdat(i).MDAT_dep),',', ...
                magdat(i).MDAT_locsrc,',', ...
                num2str(magdat(i).MDAT_prefMW),',',magdat(i).MDAT_prefMWSrc,',', ...
                num2str(magdat(i).MDAT_prefMS),',',magdat(i).MDAT_prefMSSrc,',', ...
                num2str(magdat(i).MDAT_prefmb),',',magdat(i).MDAT_prefmbSrc,',', ...
                num2str(magdat(i).MDAT_prefML),',',magdat(i).MDAT_prefMLSrc,',', mlreg,',', ...
                num2str(magdat(i).MDAT_MLrev,'%0.2f'),',',num2str(magdat(i).Mx_OrigML,'%0.2f'),',', ...
                magdat(i).MDAT_origMagType,',', ...
                num2str(magdat(i).Mx_RevML,'%0.2f'),',',magdat(i).Mx_RevMLtype,',', ...
                magdat(i).Mx_RevMLSrc,',', ...
                num2str(magdat(i).MS2MW,'%0.2f'),',',num2str(magdat(i).mb2MW,'%0.2f'),',', ...
                num2str(magdat(i).ML2MWG,'%0.2f'),',', ...
                num2str(magdat(i).prefFinalMW,'%0.2f'),',', ...
                magdat(i).prefFinalMWSrc,',',comms,char(10)];
        txt = [txt line];
    end
end

dlmwrite(outfile,txt,'delimiter','','-append');

