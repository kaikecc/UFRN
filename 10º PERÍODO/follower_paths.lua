function sysCall_init() 
        
    
    
    
    vref = 0.1 
    path = sim.getObjectHandle('Path')
    sim.setPathTargetNominalVelocity(path,vref)
    
    motorLeft=sim.getObjectHandle("Pioneer_p3dx_leftMotor")
    motorRight=sim.getObjectHandle("Pioneer_p3dx_rightMotor")
    
    
    test = sim.getObjectHandle("test")
    target = sim.getObjectHandle("target")
    ref = sim.getObjectPosition(target,-1)
    
    ref_point=sim.getObjectHandle('ref_point')            
    robot_pose=sim.getObjectHandle('robot_pose')
    
    b = 0.1655   -- dist?ncia entre as rodas
    R = 0.1955/2 -- raio das rodas
    rd = R       -- raio do roda direita
    re = R       -- raio do roda esquerda
    
    v_aux = 0.0
     
    t = 0.05
    
    aux_v_ref = {0.0,0.0}
       
    Xp, Yp = createPath();
end

function path_follower(pose)

    pos = distanceMin(pose)  -- x, y, deltaL    
    sim.setObjectPosition(test,-1,{pos[1],pos[2],0})
    v = 0.1
    print(deltaTetha(pose,pos))
    W = controleSamson(v, curvatura(pos[1]), deltaTetha(pose,pos),pos[3]) -- v, ks, deltaTetha, deltaL
    
    vd = v - (b/2 * W)
    ve = v + (b/2 * W)

    wd = vd / rd -- rd raio da roda direita
    we = ve / re -- re raio da roda esquerda
    
    return wd, we
end

function createPath()
xp = {}
yp = {}
i = 0
    for s=-1.5,1.5,0.005 do
    
    xp[i] = s
    yp[i] = -(s*s*s) + s 
   
    i = i + 1;   
    end
return xp,yp
end

function updateRobotPose()

    local pose
    position=sim.getObjectPosition(robot_pose,-1)
    orientation=sim.getObjectOrientation(robot_pose,-1)
    pose={position[1] + 0.0445,position[2],orientation[3]}
    return pose

end

function updatePose(_ref) -- Retorna as x,y e tetha do robo em relacao ao referencial

    local upP
    reFposition=sim.getObjectPosition(_ref,-1)
    reForientation=sim.getObjectOrientation(_ref,-1)
    upP={reFposition[1],reFposition[2],reForientation[3]}
    return upP

end

function deltaTetha(_pos,dist_min) -- Calcula a varia??o de Theta 

local yT = -(3*dist_min[1]*dist_min[1]) + 1
local mT = math.sqrt((yT*yT)+1)

local T = {1 / mT ,yT / mT}
moduleT = math.sqrt((T[1]*T[1]) + (T[2]*T[2]))

deltaP= {_pos[1] - dist_min[1],_pos[2] - dist_min[2]}

tethaP = math.deg(math.atan(T[2]/T[1]))
tethaR = math.deg(_pos[3])
deltaT = tethaR - tethaP
return deltaT

end

function controleSamson(v, ks, deltaTetha,dL) -- Controle de Samson

kT = 0.3 -- constante angular
kL = 0.1 -- 0.3 -- constante L
u = -(kT*deltaTetha + (kL*dL * v * math.sin(deltaTetha))/deltaTetha)
w = u + (ks*v*math.cos(deltaTetha)) / (1-ks*dL)

return w

end

function curvatura(c) -- Calcula curvatura de um ponto da curva p(s)

rls = -(3*c*c) + 1 -- derivada no ponto c

local msT = math.sqrt((rls*rls)+1)

local T = {1 / msT ,rls / msT}
moduleT = math.sqrt((T[1]*T[1]) + (T[2]*T[2]))

k = math.abs(moduleT / msT)

return k
end

function getDistance(a,b) -- Calcula a distancia entre dois pontos

    local x,y = a[1] - b[1], a[2] - b[2]
    return math.sqrt(x*x+y*y)

end

function distanceMin(referencial) -- Calcula a menor distancia entre o robo e o ponto mais pr?ximo

local deltaL = 10000
local d = 0
local i = 0
local x,y = 0
local sizePath = #xp

    while i < sizePath do
    
    d = getDistance({Xp[i],Yp[i]}, referencial)
    
        if d < deltaL then

            deltaL = d    
            x = Xp[i]
            y = Yp[i]
            
        end
       i = i + 1 
    end



return {x,y,deltaL}
end
 

function position_ref(pose)
           

    
    
    delta_x = ref[1] - pose[1]
    delta_y = ref[2] - pose[2]
    
    phi = math.atan2(delta_y,delta_x)
        
    delta_la = math.sqrt(delta_x*delta_x + delta_y*delta_y)
    
    delta_tetha = phi - pose[3]
   
    
    delta_l = delta_la * math.cos(delta_tetha)

   
    v = 0.05 
    w = 0.5*delta_tetha -- 0.05 para linha reta
    
    vd = v - (b/2 * w)
    ve = v + (b/2 * w)

    wd = vd / rd 
    we = ve / re 
      
    if  delta_la < 0.1 then
    sim.stopSimulation()
    end
    
    return wd,we

end
function trajectory_follower(pose,v_pose, pos_ref,v_ref)

-- xa = x*
-- ya = y*

-- xa_v = x*'
-- ya_v = x*' 

-- xa_a = x*''
-- ya_a = y*''


xa = pos_ref[1] -- posicao x da referencia
ya = pos_ref[2] -- posicao y da referencia

xa_v =  v_ref[1] -- velocidade x da referwncia
ya_v =  v_ref[2] -- velocidade y da referwncia

xa_a = (v_ref[1] - aux_v_ref[1]) / t --  aceleracao x da referencia
ya_a = (v_ref[2] - aux_v_ref[2]) / t --  aceleracao y da referencia

-- x_v = x'
-- y_v = y'

x = pose[1] -- posicao x do robo
y = pose[2] -- posicao y do robo

x_v = v_pose[1] -- velocidade x do robo
y_v = v_pose[2] -- velocidade y do robo

tetha =  pose[3] -- posicao angular do robo em radianos



v = math.abs(math.sqrt((x_v*x_v) + (y_v*y_v))) -- velocidade linear do robo

-- onde Kpx, Kpy > 0 e Kdx, Kdy > 0
Kpx = 0.05
Kpy = Kpx

Kdx = 1.0
Kdy = Kdx


-- Realimentacao PD - Aceleracoes de Comando
xc_a = xa_a + Kdx*(xa_v - x_v) + Kpx*(xa - x) -- aceleracao em x
yc_a = ya_a + Kdy*(ya_v - y_v) + Kpy*(ya - y) -- aceleracao em y

-- Compensasao do Modelo Nao Linear
vc_l = (math.cos(tetha)*xc_a) + (math.sin(tetha)*yc_a) -- aceleracao de comando 
wc = -((math.sin(tetha)/v)*xc_a) + ((math.cos(tetha)/v)*yc_a) -- velocidade angular de comando

-- v = aceleracao * tempo
vc = (t*vc_l) + v_aux

v_aux = vc
 
aux_v_ref = v_ref


 vd = vc - (b/2 * wc)
 ve = vc + (b/2 * wc)

 wd = vd / rd 
 we = ve / re 

return wd, we

end


function sysCall_actuation() 
  
 
  pos_ref = sim.getObjectPosition(ref_point,-1)
  v_ref = sim.getObjectVelocity(ref_point)
  
  pose = updateRobotPose()
  v_pose = sim.getObjectVelocity(robot_pose)  
  
--  wd, we = trajectory_follower(pose,v_pose, pos_ref,v_ref)    
   
--  wd ,we = path_follower(pose)
 
 wd,we = position_ref(pose)
  
 sim.setJointTargetVelocity(motorLeft,wd)
 sim.setJointTargetVelocity(motorRight,we) 
  
 
--sim.stopSimulation()
end 
