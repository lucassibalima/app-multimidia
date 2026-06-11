// todas as funções que eu preciso para o 3D.

boolean IsHovered(int r, int g, int b){
  boolean hover = false;
  color ScreenRGB = get(mouseX,mouseY);
  if (red(ScreenRGB) == r && green(ScreenRGB) == g && blue(ScreenRGB) == b){
    hover = true;
  }
  else{
    hover = false;
  }
  return hover;
}
