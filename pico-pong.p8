pico-8 cartridge // http://www.pico-8.com
version 29
__lua__




function _init()
    playerHoldingBall = 0
    player1 = {
        x = 0,
        y = 0;
        w = 4;
        h = 16;
        score = 0;
    }
    player2 = {
        x = 124,
        y = 112;
        w = 4;
        h = 16;
        score = 0;
    }
    ball = {
        x = 62;
        y = 56;
        w = 4;
        h = 4;
        dx = 1;
        dy = 1.5;
    }
end

function _update()
    local playerSpeed = 2

    -- Left Player, move, but don't go off screen
    if btn(2, 1) and player1.y >= playerSpeed then
        player1.y -= playerSpeed
    elseif btn(3, 1) and player1.y <= 124 - 16 - playerSpeed then
        player1.y += playerSpeed
    end

    -- Right Player, move, but don't go off screen
    if btn(2, 0) and player2.y >= playerSpeed then
        player2.y -= playerSpeed
    elseif btn(3, 0) and player2.y <= 124 - 16 - playerSpeed then
        player2.y += playerSpeed
    end

    -- A new round is starting
    if btn(5, 0) and playerHoldingBall == 2 then
        ball.dx = 1
        playerHoldingBall = 0
    elseif btn(5, 1) and playerHoldingBall == 1 then
        ball.dx = -1
        playerHoldingBall = 0
    end

    -- If a player is holding the ball, make it follow them
    if playerHoldingBall == 1 then
        ball.x = player1.x + player1.w + 1
        ball.y = player1.y + (player1.h / 2) - (ball.h - 2)
        return
    elseif playerHoldingBall == 2 then
        ball.x = player2.x - ball.w - 1
        ball.y = player2.y + (player2.h / 2) - (ball.h - 2)
        return
    end

    -- Ball bounces off players, or ends the game if it misses
    ball.x += ball.dx
    if intersects(ball, player1) then
        ball.x = player1.x + player1.w
        ball.dx = -ball.dx
        printh("player 1")
    elseif intersects(ball, player2) then
        ball.x = player2.x - player2.w
        ball.dx = -ball.dx
        printh("player 2")
    elseif ball.x >= 128 then
        player1.score += 1
        playerHoldingBall = 1
    elseif ball.x - ball.w <= 0 then
        player2.score += 1
        playerHoldingBall = 2
    end

    -- Always bounce off the top and bottom walls
    ball.y += ball.dy
    if ball.y >= 128 - ball.h or ball.y <=0 then
        ball.dy = -ball.dy
    end
end

function _draw()
    cls()

    -- Print the scores
    print(""..player1.score,32,0,7)
    print(""..player2.score,92,0,7)
    
    -- draw player 1
    rectfill(player1.x, player1.y, player1.x + player1.w, player1.y + player1.h, 7);
    
    -- draw player 2
    rectfill(player2.x, player2.y, player2.x + player2.w, player2.y + player2.h, 7);

    --draw ball
    rectfill(ball.x, ball.y, ball.x + ball.w, ball.y + ball.h, 4);
    
end

function intersects(rect1, rect2)
    if (rect1.x + rect1.w < rect2.x) or (rect1.x > rect2.x + rect2.w) then return false end
    if (rect1.y + rect1.h < rect2.y) or (rect1.y > rect2.y + rect2.h) then return false end
    return true
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
