pico-8 cartridge // http://www.pico-8.com
version 29
__lua__




function _init()
    player1 = {
        x = 0,
        y = 0;
    }
    player2 = {
        x = 124,
        y = 112;
    }
    ball = {
        x = 62;
        y = 56;
    }
end

function _update()

end

function _draw()
    cls()
    
    -- draw player 1
    rectfill(player1.x, player1.y, player1.x + 4, player1.y + 16, 7);
    
    -- draw player 2
    rectfill(player2.x, player2.y, player2.x + 4, player2.y + 16, 7);

    --draw ball
    rectfill(ball.x, ball.y, ball.x + 4, ball.y + 4, 4);
    
end



__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
