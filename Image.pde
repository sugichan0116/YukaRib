public class Image {
  public PImage[] Slice(String name) {
    return Slice(name, 0, 0);
  }
  
  public PImage[] Slice(String name, int widthSize, int heightSize) {
    PImage image = loadImage(name);
    PImage[] tiles;
    
    if(widthSize <= 0 || heightSize <= 0) {
      tiles = new PImage[1];
      tiles[0] = image;
      return tiles;
    }
    
    int[] size = {(image.width / widthSize), (image.height / heightSize)}; 
    tiles = new PImage[size[0] * size[1]];
    
    for(int n = 0; n < size[0]; n++) {
      for(int m = 0; m < size[1]; m++) {
        tiles[n + m * size[0]] = image.get(n * widthSize, m * heightSize, widthSize, widthSize);
      }
    }
    
    return tiles;
  }
  
  public PImage[] Slice(String name, int widthSize, int heightSize, int widthRate, int heightRate) {
    return Resize(Slice(name, widthSize, heightSize), widthRate, heightRate);
  }
  
  public PImage[] Resize(PImage[] images, int widthRate, int heightRate) {
    for(int n = 0; n < images.length; n++) {
      images[n] = Resize(images[n], widthRate, heightRate);
    }
    return images;
  }
  
  public PImage Resize(PImage image, int widthRate, int heightRate) {
    if(widthRate * heightRate == 0) return image;
    PImage tile = createImage(image.width * abs(widthRate), image.height * abs(heightRate), ARGB);
    for(int x = 0; x < image.width; x++) {
      for(int y = 0; y < image.height; y++) {
        for(int w = 0; w < abs(widthRate); w++) {
          for(int h = 0; h < abs(heightRate); h++) {
            tile.pixels[mod(x * widthRate + w, tile.width) + mod(y * heightRate + h, tile.height) * tile.width] =
              image.pixels[x + y * image.width];
          }
        }
      }
    }
    return tile;
  }

  private int mod(int a, int b) {
    return (a % b < 0) ? (a % b + b) : (a % b);
  }

}