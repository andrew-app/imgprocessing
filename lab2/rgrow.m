function S = rgrow(x0,y0,img,T)

%   Function finds set of connected pixels

S = [];




for i = 1:size(img,1)
    for j = 1:size(img,2)
        cmp = abs(int32(img(i,j))-int32(img(y0,x0)));
        if cmp <= T

            c = {[j,i]};

            S = [S,c];

        end

    end
end


end
