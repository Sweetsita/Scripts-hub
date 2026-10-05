local a=game:GetService("Players")
local b=game:GetService("UserInputService")
local c=game:GetService("RunService")
local d=a.LocalPlayer
local e=workspace.CurrentCamera
local f,g,h
local function i(j)
f=j
g=j:WaitForChild("Humanoid")
h=j:WaitForChild("HumanoidRootPart")
end
i(d.Character or d.CharacterAdded:Wait())
d.CharacterAdded:Connect(i)
local k=20
local l=Instance.new("ScreenGui")
l.Name="CustomMobileControls"
l.ResetOnSpawn=false
l.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
l.Parent=d:WaitForChild("PlayerGui")
local m=Instance.new("TextButton")
m.Name="AutoClicker"
m.Size=UDim2.new(0,70,0,70)
m.Position=UDim2.new(0.80,0,0.48,0)
m.BackgroundColor3=Color3.fromRGB(40,40,40)
m.BackgroundTransparency=0.15
m.Text="🖱"
m.TextSize=34
m.Font=Enum.Font.GothamBold
m.TextColor3=Color3.new(1,1,1)
m.AutoButtonColor=false
m.Parent=l
Instance.new("UICorner",m).CornerRadius=UDim.new(1,0)
local n={5,10,15,20,25,30}
local o=2
local p=n[o]
local q=Instance.new("TextButton")
q.Name="ClickSpeed"
q.Size=UDim2.new(0,70,0,40)
q.Position=UDim2.new(0.80,0,0.57,0)
q.BackgroundColor3=Color3.fromRGB(40,40,40)
q.BackgroundTransparency=0.15
q.Text="⚡ 10"
q.TextSize=18
q.Font=Enum.Font.GothamBold
q.TextColor3=Color3.new(1,1,1)
q.AutoButtonColor=false
q.Parent=l
Instance.new("UICorner",q).CornerRadius=UDim.new(0.25,0)
q.InputBegan:Connect(function(r)
if r.UserInputType==Enum.UserInputType.Touch or r.UserInputType==Enum.UserInputType.MouseButton1 then
o=o+1
if o>#n then o=1 end
p=n[o]
q.Text="⚡ "..p
end
end)
local s=Instance.new("TextButton")
s.Name="JumpButton"
s.Size=UDim2.new(0,75,0,75)
s.Position=UDim2.new(0.80,0,0.68,0)
s.BackgroundColor3=Color3.fromRGB(40,40,40)
s.BackgroundTransparency=0.15
s.Text="⬆️"
s.TextSize=34
s.Font=Enum.Font.GothamBold
s.TextColor3=Color3.new(1,1,1)
s.AutoButtonColor=false
s.Parent=l
Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
local t=Instance.new("Frame")
t.Name="JoystickBase"
t.Size=UDim2.new(0,140,0,140)
t.Position=UDim2.new(0.06,0,0.52,0)
t.BackgroundColor3=Color3.fromRGB(0,0,0)
t.BackgroundTransparency=0.45
t.Parent=l
Instance.new("UICorner",t).CornerRadius=UDim.new(1,0)
local u=Instance.new("Frame")
u.Name="JoystickKnob"
u.Size=UDim2.new(0,58,0,58)
u.Position=UDim2.new(0.5,-29,0.5,-29)
u.BackgroundColor3=Color3.fromRGB(255,255,255)
u.Parent=t
Instance.new("UICorner",u).CornerRadius=UDim.new(1,0)
local v=false
local w,x,y=nil,nil,false
local z,A=nil,false
local B=Vector2.zero
local C=41
local function D()
pcall(function()
local E=require(d.PlayerScripts:WaitForChild("PlayerModule"))
E:GetControls():Disable()
end)
end
D()
d.CharacterAdded:Connect(D)
task.spawn(function()
while true do
if v then
local F=e.ViewportSize
local G,H=F.X/2,F.Y/2
pcall(function()
mousemoveabs(G,H)
for I=1,p do
mouse1click()
end
end)
task.wait()
else
task.wait(0.05)
end
end
end)
m.InputBegan:Connect(function(J)
if (J.UserInputType==Enum.UserInputType.Touch or J.UserInputType==Enum.UserInputType.MouseButton1) and not w then
w=J
x=J.Position
y=false
end
end)
s.InputBegan:Connect(function(K)
if K.UserInputType==Enum.UserInputType.Touch or K.UserInputType==Enum.UserInputType.MouseButton1 then
if g then g.Jump=true end
end
end)
u.InputBegan:Connect(function(L)
if (L.UserInputType==Enum.UserInputType.Touch or L.UserInputType==Enum.UserInputType.MouseButton1) and not z then
z=L
A=true
end
end)
b.InputChanged:Connect(function(M)
if M==w then
if (M.Position-x).Magnitude>=12 then
y=true
m.Position=UDim2.new(0,M.Position.X-35,0,M.Position.Y-35)
end
elseif M==z then
local N=t.AbsolutePosition+t.AbsoluteSize/2
local O=Vector2.new(M.Position.X-N.X,M.Position.Y-N.Y)
if O.Magnitude>C then O=O.Unit*C end
B=O
end
end)
b.InputEnded:Connect(function(P)
if P==w then
if not y then
v=not v
m.BackgroundColor3=v and Color3.fromRGB(0,200,0) or Color3.fromRGB(40,40,40)
end
w=nil
y=false
elseif P==z then
z=nil
A=false
B=Vector2.zero
end
end)
c.Heartbeat:Connect(function()
local Q=Vector2.new(u.Position.X.Offset,u.Position.Y.Offset)
local R=Vector2.new(B.X-29,B.Y-29)
local S=Q:Lerp(R,0.3)
u.Position=UDim2.new(0.5,S.X,0.5,S.Y)
if A and h and g and g.Health>0 then
local T=B.X/C
local U=B.Y/C
local V=e.CFrame.LookVector
local W=e.CFrame.RightVector
local X=Vector3.new(V.X,0,V.Z)
local Y=Vector3.new(W.X,0,W.Z)
if X.Magnitude>0.01 then X=X.Unit end
if Y.Magnitude>0.01 then Y=Y.Unit end
local Z=(X*-U+Y*T)*k
h.AssemblyLinearVelocity=Vector3.new(Z.X,h.AssemblyLinearVelocity.Y,Z.Z)
elseif h then
h.AssemblyLinearVelocity=Vector3.new(0,h.AssemblyLinearVelocity.Y,0)
end
end)