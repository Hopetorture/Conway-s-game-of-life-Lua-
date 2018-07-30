function createMatrix(n,m)
  newMatrix = {}
  for i=1, n do
    newMatrix[i] = {}
    for j=1, m do
      newMatrix[i][j] = {state=false}--Cell object
    end
  end
  -- todo - populate neighbours reference list
end