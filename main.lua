-- Tutorial 1: particle move
-- Add a couple of particles and move them around

function init_planes()
    TOP_OFFSET = 1
    LEFT_OFFSET = 1
    BOTTOM_OFFSET = 1
    RIGHT_OFFSET = 1

    planes = {
        {x = 1,   y = 0, offset = love.graphics.getWidth()/2  - LEFT_OFFSET    },
        {x = 0,   y = -1, offset = love.graphics.getHeight()/2  - BOTTOM_OFFSET },
        {x = -1,  y = 0, offset = love.graphics.getWidth()/2 - RIGHT_OFFSET    },
        {x = 0,  y = 1, offset = love.graphics.getHeight()/2 - TOP_OFFSET     }
    }
    
    
end

function love.load()
    love.graphics.setMode(600,600)

    init_planes()

    circle1 = { x = 0,   y = 0, speedX = -50, speedY = 75 }
    circle2 = { x = 10,  y = 257, speedX = 58,   speedY = 19   }
    circle3 = { x = -198,    y = -220,  speedX = -136, speedY = -73  }
    circle4 = { x = 169,  y = 13, speedX = 46,   speedY = -94  }
    circle5 = { x = 116,  y = 261, speedX = 120,  speedY = 90   }
    circle6 = { x = 13,  y = -126, speedX = 15,   speedY = -117 }
    circle7 = { x = -91,  y = 140, speedX = 18,   speedY = -91  }
    circle8 = { x = 23,  y = 156, speedX = -14,  speedY = 102  }
    circle9 = { x = 229,  y = 122, speedX = -29,  speedY = 130  }
    circle10 = { x = 145, y = 239, speedX = 149,  speedY = 61   }
    circle11 = { x = 57, y = -293,   speedX = -62,  speedY = 145  }
    circle12 = { x = 55, y = -278,  speedX = 129,  speedY = 53   }
    circle13 = { x = -6, y = -38, speedX = -13,  speedY = -98  }
    circle14 = { x = 262, y = 52, speedX = 48,   speedY = 11   }
    circle15 = { x = 461, y = 266, speedX = -69,  speedY = 77   }
    circle16 = { x = 53, y = 6, speedX = 14,   speedY = -82  }
    circle17 = { x = 231, y = 213, speedX = 42,   speedY = 33   }
    circle18 = { x = -250,  y = -192, speedX = -12,  speedY = 69   }
    circle19 = { x = 92, y = -33, speedX = 100,  speedY = 141  }
    circle20 = { x = 302, y = 186, speedX = -35,  speedY = 52   }
    circles = {
                circle1 --, circle2, circle3, circle4, circle5,
                --circle6, circle7, circle8, circle9, circle10,
                --circle11, circle12, circle13, circle14, circle15,
                --circle16, circle17, circle18, circle19, circle20
            }

end

function love.update(dt)
    check_collision(dt)

    for key, value in pairs(circles) do
        --if (value.x < -(love.graphics.getWidth()/2)) and (value.speedX < 0) then
            --value.speedX = -value.speedX
        --end
        --if (value.x > love.graphics.getWidth()/2) and (value.speedX > 0) then
            --value.speedX = -value.speedX
        --end
        --if (value.y < -(love.graphics.getHeight()/2)) and (value.speedY < 0) then
            --value.speedY = -value.speedY
        --end
        --if (value.y > love.graphics.getHeight()/2) and (value.speedY > 0) then
            --value.speedY = -value.speedY
        --end

        print("update circle.speedX: "..value.speedX..", update circle.speedY: "..value.speedY)
        value.x = value.x + (value.speedX * dt)
        value.y = value.y + (value.speedY * dt)
    end
    
    --for key, circle in pairs(circles) do
    --    print("update circle.speedX: "..circle.speedX..", update circle.speedY: "..circle.speedY)
    --    circle.x = circle.x + (circle.speedX * dt)
    --    circle.y = circle.y + (circle.speedY * dt)
    --end
end

function check_collision(dt)

    local planedist = -150

    for key, circle in pairs(circles) do
        for key2, plane in pairs(planes) do
            planedist = planedist + 50
            --love.graphics.print(plane.x.." "..plane.y.." "..plane.offset, -150, planedist)
            --print(plane.x.." "..plane.y.." "..plane.offset)
            
            local normx, normy = vector_normalize(circle.speedX, circle.speedY)
            local distance = dot_product(circle.x, circle.y, plane.x, plane.y) + plane.offset
            local vector_dot = dot_product(normx, normy, plane.x, plane.y)
            

            if distance < 0 and vector_dot < 0 then
                
                print("circle at ("..circle.x..", "..circle.y..") hit the edge. plane = "..plane.x..", "..plane.y)
                newSpeedX = (circle.speedX - (2*plane.x * vector_dot))
                newSpeedY = (circle.speedY - (2*plane.y * vector_dot)) -- invert the usual behavior on y
                
                circle.speedX = newSpeedX
                circle.speedY = newSpeedY
                
                print("new speedX: "..newSpeedX..", new speedY: "..newSpeedY)
                print("circle.speedX: "..circle.speedX..", circle.speedY: "..circle.speedY)
                print("vector_dot: "..vector_dot)
            end
        end
    end
end

function xy_to_coord(x,y)
    local x1 = x - love.graphics.getWidth()/2
    local y1 = y - love.graphics.getHeight()/2
    return x1, y1

end

function coord_to_xy(x,y)
    local x1 = x + love.graphics.getWidth()/2
    local y1 = y + love.graphics.getHeight()/2
    return x1, y1
end

function dot_product (x1, y1, x2, y2)
    sum = (x1 * x2) + (y1 * y2)
    return sum
end

function vector_magnitude(x, y)
    v11 = math.sqrt(x^2 + y^2)
    return v11
end

function vector_normalize(x, y)
    local mag = vector_magnitude(x, y)
    newx = x/mag
    newy = y/mag
    return newx, newy
end


function love.draw()
    love.graphics.translate(300, 300)
    
    for key, value in pairs(circles) do
        love.graphics.circle("fill", value.x, value.y, 2)
    end
end
