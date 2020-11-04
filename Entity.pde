class Entity {

  float entityX, entityY, entitySize;
  float entitySpeedX, entitySpeedY;

  boolean mouseMovement;
  boolean clash;

  color circleColorInactive = #717171;
  color circleColorActive = #313131; 

  Entity(float temporaryEntityX, float temporaryEntityY, float temporarySize, float temporaryEntitySpeedX, float temporaryEntitySpeedY) {
    entityX = temporaryEntityX;
    entityY = temporaryEntityY;
    entitySize = temporarySize;
    entitySpeedX = temporaryEntitySpeedX;
    entitySpeedY = temporaryEntitySpeedY;
  }


  Entity(float temporaryEntityX, float temporaryEntityY, float temporarySizing, float temporaryEntitySpeedX, float temporaryEntitySpeedY, boolean temporaryMouseMovement) {
    entityX = temporaryEntityX;
    entityY = temporaryEntityY;
    entitySize = temporarySizing;
    entitySpeedX = temporaryEntitySpeedX;
    entitySpeedY = temporaryEntitySpeedY;
    mouseMovement = temporaryMouseMovement;
  }


  //Display Function : Makes the bouncing ellipsi visible
  void display() {
    if (!mouseMovement) {
      fill(circleColorInactive);
      ellipse(entityX, entityY, entitySize, entitySize);
    } else {
      fill(circleColorActive);

      if (mouseX >= 0+entitySize/2 && mouseY >= 0+entitySize/2 && mouseX <= width-entitySize/2 && mouseY <= height-entitySize/2) {
        entityX = mouseX;
        entityY = mouseY;
      }
      ellipse(entityX, entityY, entitySize, entitySize);
    }
  }

  //Move Function : animates the bouncing ellipsi
  void move() {

    // X Coordinate Speed
    entityX = entityX + entitySpeedX;
    if ( entityX >= width - entitySize/2 || entityX <= entitySize/2 ) {
      entitySpeedX *= -1;
    }

    // Y Coordinate Speed
    entityY = entityY + entitySpeedY;
    if ( entityY >= height- entitySize/2 || entityY <= entitySize/2 ) {
      entitySpeedY *= -1;
    }
  }

  //Clash function : detects overlaps in ellipsi
  void clash(Entity different) {

    //Float to check the distance between the four spatial variables of objects.
    float v = dist(entityX, entityY, different.entityX, different.entityY);

    //If statement that checks if the distance is equal to the size of the circles.
    if (v < (entitySize/2 + different.entitySize/2) && clash == false) {
      entitySpeedX = entitySpeedX *= -1;
      entitySpeedY = entitySpeedY *= -1;
      clash = true;
    }

    //Else statement that reverts clash.
    else {
      clash = false;
    }
  }
}
