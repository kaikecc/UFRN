function sysCall_init() 

    local vref = 0.0
    motorLeft=sim.getObjectHandle("Pioneer_p3dx_leftMotor")
    motorRight=sim.getObjectHandle("Pioneer_p3dx_rightMotor")
    path = sim.getObjectHandle('Path')
    sim.setPathTargetNominalVelocity(path,vref)
    ref_point=sim.getObjectHandle('ref_point')
    ref_coord=sim.getObjectHandle('ref_coord')
    ref_end = sim.getObjectHandle('end') 
    robot_pose=sim.getObjectHandle('robot_pose')

    pose = updateRobotPose()
    refP = updateRefPose()
        
end

function updateRobotPose()

    local pose
    position=sim.getObjectPosition(robot_pose,-1)
    orientation=sim.getObjectOrientation(robot_pose,-1)
    pose={position[1],position[2],orientation[3]}
    return pose

end

function curvatura(c)

rls = (-(2*c*c)-(2*c) + 2/3)

local msT = math.sqrt((rls*rls)+1)

local T = {1 / msT ,rls / msT}
moduleT = math.sqrt((T[1]*T[1]) + (T[2]*T[2]))

k = math.abs(moduleT / msT)

return k

end

function controleSamson(v, ks, deltaTetha,dL)

kT = 0.5 -- 0.3 constante angular
kL = 0.3
u = -(kT*deltaTetha + (kL*dL * v * math.sin(deltaTetha))/deltaTetha)
w = u + (ks*v*math.cos(deltaTetha)) / (1-ks*dL)

return w

end


function updateRefPose()

    local refP
    reFposition=sim.getObjectPosition(ref_point,-1)
    reForientation=sim.getObjectOrientation(ref_point,-1)
    refP={reFposition[1],reFposition[2],reForientation[3]}
    return refP

end



function getDistance(a,b)

    local x,y = (a[1] - 0.0445) - b[1], a[2] - b[2]
    return math.sqrt(x*x+y*y)

end



function controlador(r,e,teta)

b = 0.1655
R = 0.1955/2
rd = R
re = R
wd = r
we = e



Tw = {{rd/2,re/2},{rd/2,-re/b}} -- matriz de transform que eleva as coords das rodas do robo p/ as coord do robo

W = {wd,we} -- velocidade angulares das rodas

V = {}
for i = 1, 2 do
    V[i] = {}
    for j = 1, 1 do
        V[i] = Tw[i][j]*W[i] + Tw[i][j+1]*W[j+1]
    end
end

Tv = {{math.cos(teta), 0}, {math.sin(teta),0}, {0,1}} 

qv = {}
for m = 1, 3 do
    qv[m] = {}
    for n = 1, 1 do
        qv[m] = Tv[m][n]*V[n] + Tv[m][n+1]*V[n+1]
    end
end

return qv -- x', y', tetha'

end


function rotateInverse(tetha)

R = {{math.cos(tetha), math.sin(tetha),0},{-math.sin(tetha),math.cos(tetha),0},{0,0,1}}

return R
end


function deltaTetha()

p = updateRobotPose()
local a = distanceMin() -- x,y, deltaL

local yT = -(2*a[1]*a[1])-(2*a[1]) + 2/3

local mT = math.sqrt((yT*yT)+1)

local T = {1 / mT ,yT / mT}
moduleT = math.sqrt((T[1]*T[1]) + (T[2]*T[2]))

deltaP= {p[1] - a[1],p[2] - a[2]}

tethaP = math.deg(math.atan(T[2]/T[1]))
tethaR = math.deg(p[3])
deltaT = tethaR - tethaP
return deltaT

end


function distanceMin()

local deltaL = 10000
local d = 0

while d < deltaL do
for s=-5,3,0.005 do

xp = s
yp = ((-2/3)*s*s*s)-(s*s) + (2/3)*s + (1/2)

d = getDistance({xp,yp}, updateRobotPose())

if d < deltaL then

 deltaL = d    
 x = xp
 y = yp
end
end

end
 return {x,y,deltaL}

end
function sysCall_actuation()      
       
      v = 0.1
      b = 0.1655
      R = 0.1955/2
      rd = R
      re = R

     local pos = distanceMin()  -- x, y, deltaL    
     sim.setObjectPosition(ref_coord,-1,{pos[1],pos[2],0})
   
    W = controleSamson(v, curvatura(pos[1]), deltaTetha(),pos[3]) -- v, ks, deltaTetha, deltaL
    
    vd = v + b/2 * W
    ve = v - b/2 * W

    wd = vd / rd -- r raio da roda
    we = ve / re 
    
    sim.setJointTargetVelocity(motorLeft,we)
    sim.setJointTargetVelocity(motorRight,wd)
   
end 
