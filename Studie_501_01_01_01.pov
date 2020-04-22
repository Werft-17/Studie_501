
//	Studie_501
//
//	@version	1.1.1.0
//	@autor		Dietrich Roland Pehlke
//	@date		2020-04-22
//

#version 3.6;

#include "colors.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "shapes3.inc"

#include "metals.inc"

#include "textures.inc"         // LOTS of neat textures.  Lots of NEW textures.

#include "woods.inc"
#include "stones.inc"
#include "stones2.inc"
#include "glass.inc"

//#include "drp_stifte_01.pov"
#include "ext/drp_nullpunkt.pov"

global_settings {
	ambient_light rgb <1,1,1> //  <0.920723, 0.853577, 0.716325>
	irid_wavelength rgb <1.000000, 0.149131, 0.000000>
	assumed_gamma 1.8
	max_trace_level 5
	number_of_waves 10
}

// Boden
#declare render_floor = false;

// Wand
#declare render_backwall = false;

// Nullpunkt
#declare show_zero = true;
#declare show_metric_points = true;

// Messlatte(-n)
#declare show_yardstick = true;

// use_crackle
#declare use_crackle = false;

// Cameras:
#declare use_camera_number = 1;

#switch( use_camera_number)
#case(1)
	camera {
		location	<  -1.5, 2, -4 >
		look_at		< -0.1, 0.3, -0.3>
		right		x*image_width/image_height
		angle		56
	}
#break
#case(11)
	camera {
		location	<  1, 3, -3>
		look_at		< -0.0, 0.3, -0.3>
		right		x*image_width/image_height
		angle		36
	}
#break
#case(12)
	camera {
		location	<  -0.7, 3, -3>
		look_at		< -0.0, 0.3, -0.3>
		right		x*image_width/image_height
		angle		48
	}
#break
#case(13)
	camera {
		location	<  5, 8, -12 >
		look_at		< -0.0, 0.3, -0.3>
		right		x*image_width/image_height
		angle		56
	}
#break

#case(2)
	camera {
		location    <  -10, 4, -10 >
		look_at     < -1.3, 0.5, -0.3>
		right		x*image_width/image_height
		angle       24
	}
#break

#case(21)
	camera {
		location    <  -10, 5, -10 >
		look_at     < -0.5, -0.3, -0.3>
		right		x*image_width/image_height		
		angle       36
	}
#break

#case(3)
	camera {
		location    <  6, 3, -9 >
		look_at     < -0.5, 0.3, -0.3>
		right		x*image_width/image_height
		angle       24
	}
#break
#case(4)
	camera {
		location    <  6, 3, -2 >
		look_at     < -0.5, 0.3, -0.3>
		right		x*image_width/image_height
		angle       54
	}
#break
#case(5)
	camera {
		location	<  0, 5, -11 >
		look_at		< -0.0, 0.3, -0.3>
		right		x*image_width/image_height
		angle		36
	}
#break
#end
//////// ### 0.1 ###
#declare floor_image_scale = 4; // 12.0001;

#declare T_Boden = texture{
	pigment{
	    image_map{
	        jpeg "Bilder/Background_03_03_01.jpg"
	        map_type 0 // 1
	       // once
	    }
	    // translate<-0.5,-0.5,0>
		scale z*floor_image_scale
		scale x*floor_image_scale*1.414
		scale y*floor_image_scale
		translate<3.8,-2.5,0>

		rotate x*-240
	} // end pigment
}

#declare T_Wand = texture{
	#local image_scale = 3;
	pigment{
		
	    image_map{
	    	// jpeg "Bilder/1031456_Manderfeld_Kirche.jpg"
	    	jpeg "Bilder/Background_03_01_01"
	    	// jpeg "Bilder/Background_03_01_02"
	    	// jpeg "Bilder/Background_02_02_03.jpg"
	        map_type 0
	        once
	    }
	    // translate<-0.5,-0.5,0>
		scale <image_scale*1.414, image_scale, image_scale>
		
		translate<-2.1,-0.7,0>
		// rotate z*-90
	} // end pigment
normal{	
#if(use_crackle = true)
	 crackle -1 scale 2.01115
#else
     bump_map{
     // Projiziert ein Bild in die xy-Ebene
     // von <0,0,0> bis <1,1,0>
     // (Seitenverhältnis 1:1)
     // tga "MountLo3.tga"
     // jpeg "bilder/Aluminiumblech_02.jpg"
     jpeg "Bilder/Aluminiumblech_02_03.jpg"
     // Bildtyp "Bilddateiname" - Pfadname + Endung
     // erlaubte Bildtypen:
     // gif, tga, iff, ppm, pgm, png, jpeg, tiff, sys
     map_type 0 // 0=planar, 1=spherical, 2=cylindrical, 5=torus
     interpolate 3
     //  0=none, 1=linear, 2=bilinear, 4=normalized distance
   //once // falls Bild nicht wiederholt werden soll.
   //use_color //
     bump_size 12// 10
       } // end of bump_map,
    // translate<-0.5,-0.5,0>
    rotate<0,-240,0>
    scale 1

#end

    }   // end of normal
// finish { diffuse 0.9 }

}

#declare T_Wand2 = texture{
	pigment{
		
	    image_map{
	    	// jpeg "Bilder/lucido_hell.jpg"
	    	jpeg "Bilder/Background_02_02_04.jpg"
	        // jpeg "Bilder/Studie_201_04_03_01_1.jpg"
	        map_type 0
	        once
	    }
	    // translate<-0.5,-0.5,0>
		scale z*5
		scale x*5
		scale y*5
		//translate<-5.5,-0.5,0>
		translate<-2.5,-0.5,0>
		// rotate z*-90
	} // end pigment

	normal {
		bump_map{
			// Projiziert ein Bild in die xy-Ebene
			// von <0,0,0> bis <1,1,0>
			// (Seitenverhältnis 1:1)
			// tga "MountLo3.tga"
			// jpeg "bilder/Aluminiumblech_02.jpg"
			jpeg "Bilder/Aluminiumblech_02_03.jpg"
			// Bildtyp "Bilddateiname" - Pfadname + Endung
			// erlaubte Bildtypen:
			// gif, tga, iff, ppm, pgm, png, jpeg, tiff, sys
			map_type 0 // 0=planar, 1=spherical, 2=cylindrical, 5=torus
			interpolate 3
			//  0=none, 1=linear, 2=bilinear, 4=normalized distance
			//once // falls Bild nicht wiederholt werden soll.
			//use_color //
			bump_size 12// 10
		} // end of bump_map,
	    // translate<-0.5,-0.5,0>
	    rotate<0,-240,0>
	    scale 2
    }

	// finish { diffuse 0.9 }

}


#declare T_Metall2_image_scale = 10; // 23;

#declare T_myMetall2 = texture{
	pigment{
    	image_map{
    		jpeg "Bilder/Aluminiumblech_02_02.jpg"
        	// image_map{ jpeg "bilder/Metall_01_01.jpg"
        	map_type 0
        	interpolate 2
        	once
        }
        	// translate<-10,0,10>
            // scale<1,1,1>*100
	   rotate x* 120
	   scale < T_Metall2_image_scale, 0, T_Metall2_image_scale >
	   //scale x*T_Metall2_image_scale
	   translate< -10,0, -5>
    } // end pigment
    
    normal {
        bump_map{
		     // Projiziert ein Bild in die xy-Ebene
		     // von <0,0,0> bis <1,1,0>
		     // (Seitenverhältnis 1:1)
		     // tga "MountLo3.tga"
		     // jpeg "bilder/Aluminiumblech_02.jpg"
		     jpeg "Bilder/Aluminiumblech_02_03.jpg"
		     // Bildtyp "Bilddateiname" - Pfadname + Endung
		     // erlaubte Bildtypen:
		     // gif, tga, iff, ppm, pgm, png, jpeg, tiff, sys
		     map_type 0 // 0=planar, 1=spherical, 2=cylindrical, 5=torus
		     interpolate 3
		     //  0=none, 1=linear, 2=bilinear, 4=normalized distance
		   //once // falls Bild nicht wiederholt werden soll.
		   //use_color //
		     bump_size 12// 10
       } // end of bump_map,
	
    }
    
    finish {
    	diffuse 0.8
       	ambient 0.25
       	specular 0.15
       	reflection {
            0.4, 0.4
            // fresnel on
         }
	}
	// normal{ leopard -5 scale 0.015}
}
//// - 

// Boden
#if(render_floor = true)
plane {
	y,
	- 0.05
	
	texture {
	
	}
}
#end

// Wand
#if(render_backwall = true)
plane {
  z,
  5
  
  texture {
	
	T_Stone8
	scale 0.05
  }
}
#end

#declare licht_hoehe = 5.5;
#declare licht_radius = 160;
#declare licht_offset_vorne = -12.5;
#declare licht_offset_links = -0.5;
#declare licht_intensity = 0.45;

#declare lichter = array[3][7]
{
	{ // 1
		1* licht_intensity, 	// intensity
		-2, 2, 0, // offset for light (-object)
		1, 0, -0.8	// point at
	},
	{ // 2
		1* licht_intensity, 	// intensity
		0, 3, 0, // offset for light (-object)
		0, 0, 0	// point at
	},
	{ // 3
		1* licht_intensity, 	// intensity
		2, 5, 0, // offset for light (-object)
		-1, 0, 0.8	// point at
	}
}
#for(k, 0, 4)
#for(i, 0, 2)

	light_source {
		< licht_offset_links + lichter[i][1], licht_hoehe +lichter[i][2], licht_offset_vorne + lichter[i][3] +(k*4)>
		rgb <
			1.000000 // * (lichter[i][0]+(k*0.15)),
			1.000000 // * (lichter[i][0]+(k*0.10)),
			1.000000 // * (lichter[i][0]+(k*0.05))
			> * (lichter[i][0]+(k*0.11))
		
		spotlight
	 	point_at < lichter[i][4] , lichter[i][5],  lichter[i][6]+k*0.2>
		radius licht_radius
		falloff 10
		tightness 20
		photons {
			reflection on
			refraction on
			area_light
		}
		fade_distance i*0.4 +2// 2.0
		fade_power 2	//quadratic
	}
#end
#end

light_source {
	< 0.0, 5, 0>
	rgb <1.000000, 1.000000, 1.000000> * 2.0
	area_light <8.0, 5.0, 4.0>, <13.0, 5.0, 10.0>, 5, 5
	// point_at < 4, 2, 1>
	adaptive 1
	jitter
 	area_illumination
	photons {
		reflection on
		refraction on
		area_light
	}
	fade_distance 4.0
	fade_power 2	//quadratic
}

// ### 0 ###
#if( show_zero = true)
	nullpunkt(1)
#end

#if( show_metric_points = true)
	// rechts
	object {
		nullpunkt(0.5)
		translate < 1, 0, 0 >	
	}
	// links
	object {
		nullpunkt(0.5)
		translate < -1, 0, 0 >	
	}
	// links oben
	object {
		nullpunkt(0.5)
		translate < 1, 1, 0 >	
	}
	// rechts oben
	object {
		nullpunkt(0.5)
		translate < -1, 1, 0 >	
	}
	// rechts ganz oben
	object {
		nullpunkt(0.5)
		translate < 1, 2, 0 >	
	}
	// links vorne
	object {
		nullpunkt(0.5)
		translate < -1, 0, -1 >	
	}
	// links ganz vorne
	object {
		nullpunkt(0.5)
		translate < -1, 0, -2 >	
	}
	// rechts vorne
	object {
		nullpunkt(0.5)
		translate < 1, 0, -1 >	
	}
#end

// ### 1 ###
#macro Stage( pBreite, pHoehe, pLaenge )
	#local b2 = pBreite/2;
	#local h2 = pHoehe/2;
	#local s = 0.05;
union {	
	// Bodenplatte
	object {
		box {
			< -b2, 0,   pHoehe >,
			<  b2, -s, -pLaenge >	
		}	
	}
	// Viertelrund
	object {
		difference {
			// Box
			object {
				box {
					< -b2, 0, 0  >,
					<  b2, pHoehe, pHoehe >
				}	
			}
			// Cylinder
			object {
				cylinder {
					< -b2-0.01, pHoehe, 0 >,
					<  b2+0.01, pHoehe, 0 >,
					pHoehe 	
				}
			}
		}
	}
}
#end

object {
	Stage( 
		20, // Breite
		8, // Höhe
		14	// Länge
	)
	texture {
		// T_Wood11
		// T_Stone8
		// T_Silver_5C
		// T_Boden
		// scale 2
		pigment {
			White
		}
	}
	translate < 0, -0.5, 3 >
	rotate < -20, 0, 0 >
}

// #### Messlatte
#if( show_yardstick = true )

	#macro Messlatte( pLaenge )
		#local temp_size = 0.1;
		#local s2 = temp_size/2;
		#local nE = pLaenge/temp_size -1;
		#local tN = 1;
		union {
			#for(i, 0, nE)
			object {
				box {
					< 0 +i* temp_size, -s2/2, -s2/2>,
					< 0 + (i+1)* temp_size, s2/2, s2/2>	
				}
				texture {
					#if( tN = 1)
						#local tN = 0;
						pigment { White }
					#else
						#local tN = 1;
						pigment { Copper }
					#end	
				}
			}
			#end
		}
	#end

	#macro Messlatte2( pLaenge, pPigment1, pPigment2 )
		#local temp_size = 0.1;
		#local s2 = temp_size/2;
		#local nE = pLaenge/temp_size -1;
		#local tN = 1;
		union {
			#for(i, 0, nE)
			object {
				box {
					< 0 +i* temp_size, -s2/2, -s2/2>,
					< 0 + (i+1)* temp_size, s2/2, s2/2>	
				}
				texture {
					#if( tN = 1)
						#local tN = 0;
						pigment { pPigment1 }
					#else
						#local tN = 1;
						pigment { pPigment2 }
					#end	
				}
			}
			#end
		}
	#end

	object {
		Messlatte(0.6)
		translate < -0.3, 0, 0 >	
	}
	object {
		Messlatte(0.6)
		rotate < 0, 90, 0 >
		translate < 1, 0, -0.7 >	
	}
	object {
		Messlatte(0.2)
		rotate < 0, 0, 90 >
		translate < 1, 0.9, 0 >	
	}
	object {
		Messlatte2(2 , White, Gray )
		// rotate < 45, 0, 0 >
		translate < -1, -0.3, 0 >	
	}
	object {
		Messlatte2(2 , White, Gray )
		rotate < 0, 0, 90 >
		translate < 1.27, 0, 0 >	
	}
#end
