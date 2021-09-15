function sysCall_init() 
    usensors={-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}
    for i=1,16,1 do
        usensors[i]=sim.getObjectHandle("Pioneer_p3dx_ultrasonicSensor"..i)
    end
    Robot = sim.getObjectHandle("Pioneer_p3dx")
    motorLeft=sim.getObjectHandle("Pioneer_p3dx_leftMotor")
    motorRight=sim.getObjectHandle("Pioneer_p3dx_rightMotor")
    ref = sim.getObjectHandle("ref")
    noDetectionDist=0.4
    maxDetectionDist=0.2
    detect={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
    braitenbergL={-0.2,-0.4,-0.6,-0.8,-1,-1.2,-1.4,-1.6, 0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0}
    braitenbergR={-1.6,-1.4,-1.2,-1,-0.8,-0.6,-0.4,-0.2, 0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0}
    v0=2.0
    x = {}
    y = {}
    m = {}

end
-- This is a very simple EXAMPLE navigation program, which avoids obstacles using the Braitenberg algorithm


function sysCall_cleanup() 
 
end 

function sysCall_actuation()

    
    M = sim.getObjectMatrix(Robot,-1)
    --sim.invertMatrix(M)
    posSensor = {}
    sensorWorld = {}
    achou = {}
    dist = {}
    coord = {}
    positionObject = {}
    for i=1,16,1 do
        posSensor[i] = sim.getObjectMatrix(usensors[i], Robot)
        
        res,distaa=sim.readProximitySensor(usensors[i])
        
        if (res>0) and (distaa<noDetectionDist) then
            if (distaa<maxDetectionDist) then
                distaa=maxDetectionDist
            end
            detect[i]=1-((distaa-maxDetectionDist)/(noDetectionDist-maxDetectionDist))
        else
            detect[i]=0
        end
        
        --sim.invertMatrix(posSensor[i])
        sensorWorld[i] = sim.multiplyMatrices(M, posSensor[i])
        achou[i], dist[i], coord[i] = sim.readProximitySensor(usensors[i])
        if achou[i] == 1 then
            positionObject[i] = sim.multiplyVector(sensorWorld[i],coord[i])
            x[i] = positionObject[i][1]
            y[i] = positionObject[i][2]
            
             sim.setObjectPosition(ref,-1,{positionObject[i][1],positionObject[i][2],0.55})
            --x = positionObject[i][1]
            --y = positionObject[i][2]              

        else
            positionObject[i] = {-9, -9, -9}
            x[i] = positionObject[i][1]
            y[i] = positionObject[i][2]                     
        end
      
    end
  
       m = {x, y}
       write('C:/Users/kaike/Desktop/mapa.csv', m,',')
       
       
   

    vLeft=v0
    vRight=v0
    
    for i=1,16,1 do
        vLeft=vLeft+braitenbergL[i]*detect[i]
        vRight=vRight+braitenbergR[i]*detect[i]
    end
     sim.setJointTargetVelocity(motorLeft,vLeft)
     sim.setJointTargetVelocity(motorRight,vRight)

end

function write(path, data, sep)
    sep = sep or ','
    local file = assert(io.open(path, "a"))

    for j = 1, #data[1] do
        for i = 1, #data do
            if i > 1 then file:write(sep) end
            file:write(data[i][j])
        end 
        file:write('\n')

    end
    file:close()
end
