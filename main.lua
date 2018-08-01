function bool_to_num(v)
  return v and 1 or 0
end
function createMatrix(n,m)
  newMatrix = {}  -- should it be local & returned value?
  for i=1, n do
    newMatrix[i] = {}
    for j=1, m do
      newMatrix[i][j] = {isAlive=false}--Cell object
    end
  end
  
-- populate cells with 8 neighbours; neighbours population refs is here to avoid calculating neighbours at runtime
  for i = 2,n - 1 do  
    for j = 2, m - 1 do
      newMatrix[i][j].neighbours = {
        newMatrix[i + 1][j],     newMatrix[i - 1][j],      -- lower and upper cells
        newMatrix[i][j + 1],     newMatrix[i][j - 1],      -- right and left cells 
        newMatrix[i - 1][j - 1], newMatrix[i + 1][j + 1],  -- diagonal 1
        newMatrix[i + 1][j - 1], newMatrix[i - 1][j + 1]   -- diagonal 2
        }
    end  
  end
  --populate corners, not expecting small matrix size
  newMatrix[n][m].neighbours = { -- lower right cell
    newMatrix[n - 1][m], newMatrix[n][m - 1], newMatrix[n - 1][m - 1]}
  newMatrix[n][1].neighbours = { -- lower left cell
    newMatrix[n - 1][1], newMatrix[n][2], newMatrix[n-1][2]}
  
  newMatrix[1][m].neighbours = { -- top right
    newMatrix[1][m - 1], newMatrix[2][m], newMatrix[2][m - 1]}  
  newMatrix[1][1].neighbours = { -- top left cell
    newMatrix[1][2], newMatrix[2][1], newMatrix[2][2]}
    
  for j = 2,m - 1 do   -- populate upper row, 12 .. 14, without corners  
    newMatrix[1][j].neighbours = {
        newMatrix[1][j + 1], newMatrix[1][j - 1], -- left and right 
        newMatrix[2][j + 1], newMatrix[2][j - 1], -- diagonal bottom left and right
        newMatrix[2][j]                           -- below
      }
  end  
  for j = 2, m - 1 do  -- bottom row w/o corners
    newMatrix[n][j].neighbours = {
        newMatrix[n][j - 1],     newMatrix[n][j + 1],     -- left and right neighbours
        newMatrix[n - 1][j + 1], newMatrix[n - 1][j - 1], -- diagonal l and r
        newMatrix[n - 1][j]                               -- above
      }
  end
  for i = 2, n - 1 do  -- rightmost row w/o corners
    newMatrix[i][m].neighbours = {
        newMatrix[i + 1][m],    newMatrix[i - 1][m],     --above and below cells
        newMatrix[i + 1][m - 1],newMatrix[i - 1][m - 1], -- diagonals
        newMatrix[i][m - 1]                              -- cell to the left
      }      
  end
  for i = 2, n - 1 do -- leftmost row w/o corners
    newMatrix[i][1].neighbours = {
        newMatrix[i + 1][1], newMatrix[i - 1][1],   -- above and below
        newMatrix[i + 1][2], newMatrix[i - 1][2],   -- diagonals 
        newMatrix[i][2]                             -- cell to the right
      }
  end
  return newMatrix
end  -- end create Matrix

n,m = 5,5
m1 = createMatrix(n,m)
m2 = createMatrix(n,m)
--m1[1][1].neighbours[1].isAlive=true   --reference test
--m1[1][1].neighbours[2].isAlive=true
--m1[1][1].neighbours[3].isAlive=true
--for _, v in ipairs(m1[1][1].neighbours) do -- how to do it???
--   print(v.isALive)
--end
for i=1,n do
  for j=1,m do
    io.write(tostring(bool_to_num(m1[i][j].isAlive))..' ')
  end
  print()
end

counter = 50
while counter ~= 0 do
  counter = counter - 1
  for i=1,n do
    for j=1,m do
      --pseudocode
      --for neigbour in  
    end -- j for end
  end -- i for end
end -- while end
-- todo: load starting state and run cycle1
--[[
n = 5, m = 5
11 12 13 14 15
21 22 23 24 25
31 32 33 34 35
41 42 43 44 45
51 52 53 54 55
]]
