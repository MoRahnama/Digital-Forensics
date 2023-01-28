source = imread('Encoded-Image.png');
height = size(source,1);
width = size(source,2);
m =  double( source(1:1:1) ) * 8  ;
k = 1;
for i = 1 : height
  for j = 1 : width
      if (k <= m)
          b(k) = mod(double(s(i,j)),2);
          k = k + 1;
      end
  end
end
Vector = b;
Values = [ 128 64 32 16 8 4 2 1 ];
Vector = Vector(:);
Matrix = reshape(Vector,8,[]);
textString = char(Values*Matrix);
disp('The following message successfully extracted from the cover file:');
disp(textString);