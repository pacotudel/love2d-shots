-- https://dev.to/mimikyu/100-days-of-code-days-2-and-3-bullet-hell-with-lua-and-love-2d-for-ludum-dare-1b05
color = { }
color.red = {1,0,0}
color.green = {0,1,0}
color.blue = {0,0,1}
color.a = {1,1,0}
color.b = {1,0,1}
color.b = {0,1,1}
color.black = {0,0,0}
color.white = {1,1,1}

player = {
	x = 380,
	y = 280,
	speed = 200,
	heat = 0,
	heatp = 0.1
}
bullets = { }

Tipo = 2

function love.update(dt)
	if love.keyboard.isDown("left") then
		player.x = player.x - dt * player.speed
    end
	if love.keyboard.isDown("right") then
		player.x = player.x + dt * player.speed
    end
	if love.keyboard.isDown("up") then
		player.y = player.y - dt * player.speed
    end
	if love.keyboard.isDown("down") then
		player.y = player.y + dt * player.speed
    end
	if player.x < 0 then player.x = 0 end
	if player.x > 750 then player.x = 750 end
	if player.y < 100 then player.y = 100 end
	if player.y > 550 then player.y = 550 end
	-- shooting:
	if love.keyboard.isDown("space") and player.heat <= 0 then
		local direction = math.atan2(love.mouse.getY() - player.y, love.mouse.getX() - player.x)
		--table.insert(bullets, {	x = player.x, y = player.y,	dir = direction, speed = 400 })
		if Tipo==0 then
			table.insert(bullets, {	x = player.x + 25, y = player.y - 40,	dir = -(math.pi/2), speed = 350 })
		end
		if Tipo==1 then
			table.insert(bullets, {	x = player.x - 55, y = player.y + 5,	dir = -(math.pi/2), speed = 350 })
			table.insert(bullets, {	x = player.x + 105, y = player.y + 5,	dir = -(math.pi/2), speed = 350 })
		end
		if Tipo==2 then
			table.insert(bullets, {	x = player.x + 25 + 4, y = player.y - 40,	dir = -(math.pi/2), speed = 350 })
			table.insert(bullets, {	x = player.x + 25 - 4, y = player.y - 40,	dir = -(math.pi/2), speed = 350 })
		end
		if Tipo==3 then
			table.insert(bullets, {	x = player.x + 25 + 4, y = player.y - 40,	dir = -(math.pi/2), speed = 400 })
			table.insert(bullets, {	x = player.x + 25 - 4, y = player.y - 40,	dir = -(math.pi/2), speed = 400 })
			table.insert(bullets, {	x = player.x - 55, y = player.y + 5,	dir = -(math.pi/2), speed = 400 })
			table.insert(bullets, {	x = player.x + 105, y = player.y + 5,	dir = -(math.pi/2), speed = 400 })
		end
		if Tipo==4 then
			table.insert(bullets, {	x = player.x + 25, y = player.y - 40,	dir = -(math.pi/2), speed = 350 })
			table.insert(bullets, {	x = player.x + 25, y = player.y - 40,	dir = math.pi, speed = 350 })
			table.insert(bullets, {	x = player.x + 25, y = player.y - 40,	dir = 0, speed = 350 })
		end
		if Tipo==5 then
			table.insert(bullets, {	x = player.x + 25, y = player.y - 40,	dir = -(math.pi/2), speed = 350 })
			table.insert(bullets, {	x = player.x + 25, y = player.y - 40,	dir = -(math.pi/2)+0.2, speed = 350 })
			table.insert(bullets, {	x = player.x + 25, y = player.y - 40,	dir = -(math.pi/2)-0.2, speed = 350 })
		end
		if Tipo==6 then
			table.insert(bullets, {	x = player.x + 25, y = player.y - 40,	dir = -(math.pi/2), speed = 350 })
			table.insert(bullets, {	x = player.x + 25, y = player.y - 40,	dir = -(math.pi/2)+0.2, speed = 350 })
			table.insert(bullets, {	x = player.x + 25, y = player.y - 40,	dir = -(math.pi/2)-0.2, speed = 350 })
			table.insert(bullets, {	x = player.x + 25, y = player.y - 40,	dir = -(math.pi/2)+0.4, speed = 350 })
			table.insert(bullets, {	x = player.x + 25, y = player.y - 40,	dir = -(math.pi/2)-0.4, speed = 350 })
		end
		if Tipo==7 then
			table.insert(bullets, {	x = player.x + 25, y = player.y - 40,	dir = -(math.pi/2), speed = 350 })
			table.insert(bullets, {	x = player.x + 25, y = player.y - 40,	dir = -(math.pi/2)+0.1, speed = 350 })
			table.insert(bullets, {	x = player.x + 25, y = player.y - 40,	dir = -(math.pi/2)-0.1, speed = 350 })
			table.insert(bullets, {	x = player.x + 25, y = player.y - 40,	dir = -(math.pi/2)+0.2, speed = 350 })
			table.insert(bullets, {	x = player.x + 25, y = player.y - 40,	dir = -(math.pi/2)-0.2, speed = 350 })
			table.insert(bullets, {	x = player.x + 25, y = player.y - 40,	dir = -(math.pi/2)+0.3, speed = 350 })
			table.insert(bullets, {	x = player.x + 25, y = player.y - 40,	dir = -(math.pi/2)-0.3, speed = 350 })
		end
		if Tipo==8 then
			for i = 0, 2 * math.pi, 0.2 do
			  table.insert(bullets, {	x = player.x + 25, y = player.y - 40,	dir = i, speed = 360  })
			end
		end
		if Tipo==9 then
			for i = 0, 2 * math.pi, 0.2 do
			  table.insert(bullets, {	x = player.x + 25, y = player.y - 40,	dir = i, speed = 350 + (30 * i) })
			end
		end
		player.heat = player.heatp
	end
	
	player.heat = math.max(0, player.heat - dt)
	-- update bullets:
    for i, o in ipairs(bullets) do
        o.x = o.x + math.cos(o.dir) * o.speed * dt
        o.y = o.y + math.sin(o.dir) * o.speed * dt
    end
	-- clean up out-of-screen bullets:
	for i = #bullets, 1, -1 do
        local o = bullets[i]
        if (o.x < -10) or (o.x > love.graphics.getWidth() + 10)
        or (o.y < -10) or (o.y > love.graphics.getHeight() + 10) then
            table.remove(bullets, i)
        end
    end
end

function bossPattern4(dt)
    if attack4Delay then
        for index = 0, 15, math.pi/15 do
			--table.insert(bullets, {	x = player.x, y = player.y,	dir = direction, speed = 400 })
			-- bullet = {xPos = boss.xPos, yPos = boss.yPos, width = 16, height=16, 100, img = bossBullet, behavior = sixteenWayBullet, number = index + attack4Spin, bulletSpin = 0}
            bullet = {x = player.x, y = player.y, dir = -(math.pi/2), speed = 400 }
            table.insert(bullets, bullet)
        end
        --attack4Delay = false
        --attack4Timer = attack4TimerMax
        --attack4Spin = attack4Spin + 0.1
    end

    if attack4Timer > 0 then
        attack4Timer = attack4Timer - dt
    else
        attack4Delay = true
    end
  end
 --[[ 
function sixteenWayBullet(dt, index, bullet)
    bullet.yPos = bullet.yPos + dt * 100 * math.sin(math.abs(math.rad(bullet.number * 22.5)))
    bullet.xPos = bullet.xPos - dt * 100 * math.cos(math.abs(math.rad(bullet.number * 22.5)))
    if ((bullet.yPos < 0) or (bullet.yPos > love.graphics.getHeight()))  then
        table.remove(bossBullets, index)
    end
  end
]]--

 
function love.draw()
love.graphics.setColor(1, 0, 0)
	--semaforo(100,100)
	-- draw player:
	
	nave_paco( player.x + 80, player.y) 
	nave_paco( player.x - 80, player.y) 
	nave1( player.x, player.y)
	
	-- draw bullets:
	love.graphics.setColor(255, 255, 255, 224)
	for i, o in ipairs(bullets) do
		--love.graphics.circle('fill', o.x, o.y, 10, 8)
		shot_red(o.x,o.y)
	end
	
	osd(10,10,"Tipo: " .. Tipo)
	osd(10,20,"q,a laser change, arrows move ")
	osd(10,30,"Num Bullets: " .. #bullets)
	osd(10,40,"Player.x: " .. math.floor(player.x,1) .. " Player.y: " .. math.floor(player.y,1))
end
 
function love.load()
	--love.graphics.setBackgroundColor(50, 75, 125)
end

function love.keypressed(key, unicode)
	if key == "q" then
      Tipo = Tipo + 1
	end
	if key == "a" then
      Tipo = Tipo - 1
	end
end

function nave1(x,y)
	size_x = 50
	love.graphics.push()
	-- Parte llana abajo
	
	love.graphics.setColor(color.red)
	love.graphics.rectangle( "fill", x, y, size_x, 10 )
	-- Morro
	love.graphics.setColor(color.green)
	love.graphics.rectangle( "fill", x + 20, y - 30, 10, 30 )
	
	-- Aleron derecho
	love.graphics.polygon('fill', {x+30, y, x+30, y-20, x+40, y})
	-- Aleron izquierdo
	love.graphics.polygon('fill', {x+10, y, x+20, y-21, x+20, y})
	-- Morro
	love.graphics.setColor(color.red)
	love.graphics.polygon('fill', {x+15, y-25, x+25, y-45, x+35, y-25})
	-- Laseres
	love.graphics.setColor(color.white)
	love.graphics.rectangle( "fill", (x + ((size_x/6)*1))-3, y - 15, 3, 15 )
	love.graphics.rectangle( "fill", (x+size_x) - ((size_x/6)*1), y - 15, 3, 15 )
	love.graphics.pop()
end

function semaforo(x,y)
	love.graphics.push()
	love.graphics.circle("fill", x, y, 20)

	love.graphics.setColor(0, 0, 1)
	love.graphics.circle("fill", x, y+50, 20)

	myColor = {0, 1, 0, 1}
	love.graphics.setColor(myColor)
	love.graphics.circle("fill", x, y+100, 20)
	love.graphics.pop()
end

function shot_red(x,y)
	love.graphics.push()
	love.graphics.setColor(color.white)
	love.graphics.circle("fill", x, y, 5,5)
	love.graphics.setColor(color.red)
	love.graphics.circle("fill", x, y, 4,5)
	love.graphics.pop()
end

function nave_paco(x,y)
	love.graphics.push()
	love.graphics.setColor(color.white)
	love.graphics.rectangle( "fill", x+10, y, 10, 60 )
	love.graphics.rectangle( "fill", x+30, y, 10, 60 )
	love.graphics.rectangle( "fill", x, y+20, 50, 20 )
	love.graphics.setColor(color.black)
	love.graphics.rectangle( "fill", x+11, y+1, 8, 58 )
	love.graphics.rectangle( "fill", x+31, y+1, 8, 58 )
	love.graphics.rectangle( "fill", x+1, y+21, 48, 18 )
	love.graphics.setColor(color.green)
	love.graphics.rectangle( "fill", x+11, y+11, 8, 38 )
	love.graphics.setColor(color.blue)
	love.graphics.rectangle( "fill", x+31, y+11, 8, 38 )
	love.graphics.setColor(color.red)
	love.graphics.rectangle( "fill", x+20, y+21, 12, 18 )
	love.graphics.pop()
end

function osd(x,y,texto)
	love.graphics.push()
	love.graphics.setColor(color.white)
	love.graphics.print(texto,x,y)
	love.graphics.pop()
end