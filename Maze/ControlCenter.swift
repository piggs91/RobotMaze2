//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//
import UIKit

class ControlCenter {

    var mazeController: MazeController!

    func moveComplexRobot(robot: ComplexRobotObject) {
      
  
        let robotIsBlocked = isFacingWall(robot, direction: robot.direction)
        let myWallInfo = checkWalls(robot)
   
        let isThreeWayJunction = (myWallInfo.numberOfWalls == 1)
        let isTwoWayPath = ( myWallInfo.numberOfWalls == 2 )
        let isDeadEnd = (myWallInfo.numberOfWalls == 3 )
 
        
        if isThreeWayJunction && robotIsBlocked {
            randomlyRotateRightOrLeft(robot)
        }
        else if isThreeWayJunction && !robotIsBlocked
        {
            continueStraightOrRotate(robot)
        }
        else if isTwoWayPath && !robotIsBlocked
        {
            robot.move()
        }
        else if isTwoWayPath && robotIsBlocked{
            turnTowardClearPath(robot, wallInfo: myWallInfo)
        }
        else if isDeadEnd && !robotIsBlocked
        {
            robot.move()
        }
        else if isDeadEnd && robotIsBlocked
        {
            randomlyRotateRightOrLeft(robot)
        }
      

        
    }
    
    func previousMoveIsFinished(robot: ComplexRobotObject) {
            self.moveComplexRobot(robot)
    }
    
}