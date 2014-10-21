Particle[] field = new Particle[200];
int resetCounter=0;
int oddCount=0;
boolean oddUp=true;
int timer=0;
float fade=50;
void setup()
{
	size(500,550);
	background(0);
	stroke(0);
	strokeWeight(5);
	noFill();
	for (int i = 0; i < 1; i++) 
	{
		field[i]= new OddballParticle();
	}
	for (int i = 1; i < field.length; i++) {
		field[i] = new NormalParticle();
	}
	field[100]= new JumboParticle();
// frameRate(1);
}
void draw()
{
	noStroke();
	fill(0,0,0,fade);
	rect(0, 0, 500, 500);
	fill(0,0,0);
	stroke(0,100,255);
	rect(0,500,500,50);
	fill(0,100,255);
	text(oddCount+1+ " Oddball Particles", 10, 520);
	text(200-oddCount-2+ " Normal Particles", 150, 520);
	text(1 + " Jumbo Particle", 290, 520);
	for (int i = 0; i < field.length; i++) {
		field[i].show();
		field[i].move();
		field[i].edgeBehavior();
		
	}
	if (timer%10==0 && timer!=0 && oddUp)
	
	// if (resetCounter>50 && oddUp)
	{
		oddCount++;
		field[oddCount]=new OddballParticle();
		resetCounter=0;
	}

if (timer%20==0 && timer!=0 && !oddUp)
	// if (resetCounter>50 && !oddUp)
	{
		oddCount--;
		field[oddCount]=new NormalParticle();
		resetCounter=0;
	}
	 
if (oddCount>20) 
{
	oddUp=false;
}
if (oddCount<=0)
{
	oddUp=true;
}
// System.out.println(oddCount +", "+ (field.length-oddCount) + ", " + timer);

timer++;
fill(0);
noStroke();
// ellipse(250,250,40,40);
}
class NormalParticle implements Particle
{
	double x,y,dx,dy,angle,speed;
	int ringWidth,ringHeight;
	boolean reset;
	color rgb;
	NormalParticle()
	{
		reset=false;
		x= 250;
		y= 250;
		angle=Math.random()*TWO_PI;
		speed=Math.random()*3+1;
		rgb= color((int)(Math.random()*200),(int)(Math.random()*200),(int)(Math.random()*200),200); 
		ringHeight=(int)(Math.random()*10+5);
		ringWidth=(int)(Math.random()*10+5);
	}
	public void show()
	{
		stroke(rgb);
		strokeWeight(5);
		noFill();
		if (key=='1')
		{
			noFill();
			stroke(rgb);
			ellipse((float)x, (float)y, (float)ringWidth, (float)ringHeight);
			fade=50;
		}
		else if (key=='2')
		{
						point((float)x, (float)y);

			fade=50;
		}
		else {
			stroke(255);
			point((float)x, (float)y);
			fade=10;
		}
	}
	public void move()
	{
		x+=speed*Math.cos(angle);
		y+=speed*Math.sin(angle);
	}
	public void edgeBehavior()
	{
		// if (!trig)
		// {
		// 	if (x <= ringWidth/2 || x >= 500-ringWidth/2)
		// 	{
		// 		if(b)
		// 		dx=-dx;
		// 	else 
		// 	reset=true;
		


		// // 	}
		// 	if (y <= ringHeight/2 || y >= 500-ringHeight/2)
		// 	{
		// 		if(b)
		// 		dy=-dy;
		// 	else 
		// 	reset=true;

		// 	}
		
		

		if (x <= ringWidth/2 || x >= 500-ringWidth/2 || y <= ringHeight/2 || y >= 500-ringHeight/2)
		{
		x= 250;
		y= 250;
		angle=Math.random()*TWO_PI;
		speed=Math.random()*3+1;
		rgb= color((int)(Math.random()*200),(int)(Math.random()*200),(int)(Math.random()*200),200); 
		ringHeight=(int)(Math.random()*10+5);
		ringWidth=(int)(Math.random()*10+5);
		resetCounter++;
	}
		}
		
	}
	
class JumboParticle extends NormalParticle
{
	JumboParticle()
	{
		ringHeight=(int)(Math.random()*10+25);
		ringWidth=(int)(Math.random()*10+25);
	}
	public void show()
	{
		stroke(rgb);
		noFill();
		if (key=='1')
		{
			strokeWeight(10);
			noFill();
			stroke(rgb);
			ellipse((float)x, (float)y, (float)ringWidth, (float)ringHeight);

			fade=50;
		}
		else if (key=='2')
		{
			strokeWeight(50);
			point((float)x, (float)y);

			fade=50;
		}
		else {
			stroke(255);
			strokeWeight(50);

			point((float)x, (float)y);
			fade=10;
		}
	}
public void edgeBehavior()
{
	if (x <= ringWidth/2 || x >= 500-ringWidth/2 || y <= ringHeight/2 || y >= 500-ringHeight/2)
		{
		x= 250;
		y= 250;
		angle=Math.random()*TWO_PI;
		speed=Math.random()*3+1;
		rgb= color((int)(Math.random()*200),(int)(Math.random()*200),(int)(Math.random()*200),200); 
		ringHeight=(int)(Math.random()*10+25);
		ringWidth=(int)(Math.random()*10+25);
		resetCounter++;
	}
}
}

interface Particle
{
	public void show();
	public void move();
	public void edgeBehavior();
	
}
class OddballParticle implements Particle
{
	double x,y,dx,dy;
	boolean reset;
	int diam;
	OddballParticle()
	{
		x= 250;
		y= 250;
		dx= Math.random()*10-5;
		dy= Math.random()*10-5;
		while(dx==0 || dy==0 || dx==dy|| dx==-dy)
		{
			dx= Math.random()*10-5;
			dy= Math.random()*10-5;	
		}
		reset=false;
		diam=20;
	}
	public void show()
	{
		noStroke();

		fill(255);
		ellipse((float)x,(float)y,diam,diam);

	}
	public void move()
	{
		x+=dx;
		y+=dy;
	}
	public void edgeBehavior()
	{
		if (x <= diam/2 || x >= 500-diam/2)
		{		
			dx=-dx;
		}
		if (y <= diam/2 || y >= 500-diam/2)
		{
			dy=-dy;
		}

	}
	
}