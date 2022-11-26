//This function draws the GAMEOVER screen.

void gameOver() {
  
  drawGameover();
  handleGameoverButtons();
  
}

void drawGameover() {
   background(brown);
  fill(white);
  textSize(80);
  text("You lose", 490, 150);
  text("Better luck next time!", 500, 300);
  
  //back to menu button
  menuButton.show();
}

void handleGameoverButtons() {
  if(menuButton.clicked) {
   mode = INTRO;
   money = 10;
   lives = 3;
   wave = 0;
   
   //REMOVE ALL MOBS
   for (int i = 0; i < slows.size(); i++) {
    slows.remove(i); 
   }
   for (int i = 0; i < rings.size(); i++) {
    rings.remove(i); 
   }
   for (int i = 0; i < bullets.size(); i++) {
    bullets.remove(i); 
   }
   
   for(int i = 0; i < mobs.size(); i++) {
    mobs.remove(0); 
   }
   
   //REMOVE ALL TOWERS
   for(int i = 0; i < towers.size(); i++) {
    towers.remove(0); 
     
   }
    
  }
}
