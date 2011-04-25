-- Tutorial 1: particle move
-- Add a couple of particles and move them around


function love.load()
    love.graphics.setMode(600,600)

    circle1 = { x = 79,   y = 215, speedX = -139, speedY = -121 }
    circle2 = { x = 310,  y = 557, speedX = 58,   speedY = 19   }
    circle3 = { x = 2,    y = 80,  speedX = -136, speedY = -73  }
    circle4 = { x = 469,  y = 313, speedX = 46,   speedY = -94  }
    circle5 = { x = 416,  y = 561, speedX = 120,  speedY = 90   }
    circle6 = { x = 313,  y = 174, speedX = 15,   speedY = -117 }
    circle7 = { x = 209,  y = 440, speedX = 18,   speedY = -91  }
    circle8 = { x = 323,  y = 456, speedX = -14,  speedY = 102  }
    circle9 = { x = 529,  y = 422, speedX = -29,  speedY = 130  }
    circle10 = { x = 445, y = 539, speedX = 149,  speedY = 61   }
    circle11 = { x = 357, y = 7,   speedX = -62,  speedY = 145  }
    circle12 = { x = 355, y = 22,  speedX = 129,  speedY = 53   }
    circle13 = { x = 294, y = 262, speedX = -13,  speedY = -98  }
    circle14 = { x = 562, y = 352, speedX = 48,   speedY = 11   }
    circle15 = { x = 761, y = 566, speedX = -69,  speedY = 77   }
    circle16 = { x = 353, y = 306, speedX = 14,   speedY = -82  }
    circle17 = { x = 531, y = 513, speedX = 42,   speedY = 33   }
    circle18 = { x = 50,  y = 108, speedX = -12,  speedY = 69   }
    circle19 = { x = 392, y = 267, speedX = 100,  speedY = 141  }
    circle20 = { x = 602, y = 486, speedX = -35,  speedY = 52   }
    circles = {
                circle1, circle2, circle3, circle4, circle5,
                circle6, circle7, circle8, circle9, circle10,
                circle11, circle12, circle13, circle14, circle15,
                circle16, circle17, circle18, circle19, circle20
            }

end

function love.update(dt)

    for key, value in pairs(circles) do
        if (value.x < -1) and (value.speedX < 0) then
            value.speedX = -value.speedX
        end
        if (value.x > love.graphics.getWidth()) and (value.speedX > 0) then
            value.speedX = -value.speedX
        end
        if (value.y < -1) and (value.speedY < 0) then
            value.speedY = -value.speedY
        end
        if (value.y > love.graphics.getHeight()) and (value.speedY > 0) then
            value.speedY = -value.speedY
        end

        value.x = value.x + (value.speedX * dt)
        value.y = value.y + (value.speedY * dt)
    end
end

function love.draw()
    for key, value in pairs(circles) do
        love.graphics.circle("fill", value.x, value.y, 2)
    end
end