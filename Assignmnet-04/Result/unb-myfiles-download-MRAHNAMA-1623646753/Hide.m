fid = fopen('Message.txt');
msg = fscanf(fid, '%c', Inf);
fclose(fid);
cover = imread('vangogh-self-portrait.bmp');
cover(1:1:1)= length(msg) ; 
cover=imresize(cover,[size(cover,1) size(cover,2)],'nearest');
message = msg ;  
message = strtrim(message);
m = length(message) * 8;
AC = uint8(message);
BS = transpose(dec2bin(AC,8));
BS = BS(:);
N = length(BS);
b = zeros(N,1);
for i = 1:N
  if(BS(i) == '1')
      b(i) = 1;
  else
      b(i) = 0;
  end
end
s = cover;
  height = size(cover,1);
  width = size(cover,2);
k = 1;
for i = 1 : height
  for j = 1 : width
      LSB = mod(double(cover(i,j)), 2);
      if (k>m || LSB == b(k))
          s(i,j) = cover(i,j);
      elseif(LSB == 1)
          s(i,j) = (cover(i,j) - 1);
      elseif(LSB == 0)
          s(i,j) = (cover(i,j) + 1);
      end
  k = k + 1;
  end
end
imgWTxt = 'Encoded-Image.png';
imwrite(s,imgWTxt);
disp('Message successfully embedded into the cover file');