#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 416

#define CELL_SIZE 8
#define CELL_HMAX (SCREEN_WIDTH/CELL_SIZE)
#define CELL_VMAX (SCREEN_HEIGHT/CELL_SIZE)

#define EVOLVE_INTERVAL 0.05

typedef enum{
    silver2DPlane = 0,
    silverCyliner,
    silverCyliner2,
    silverBessel
}ShapeType;