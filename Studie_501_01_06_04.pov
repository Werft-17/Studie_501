
//	Studie_501
//
//	@version	1.6.4.0
//	@autor		Dietrich Roland Pehlke
//	@date		2020-05-24
//

#version 3.6;

#include "colors.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "shapes3.inc"

#include "metals.inc"

#include "textures.inc"

#include "woods.inc"
#include "stones.inc"
#include "stones2.inc"
#include "glass.inc"

#include "ext/drp_stifte_01.pov"
#include "ext/drp_nullpunkt.pov"

global_settings {
	ambient_light rgb <1, 1, 1> // <0.920723, 0.853577, 0.716325>
	irid_wavelength rgb <1.000000, 0.149131, 0.000000>
	assumed_gamma 1.8
	max_trace_level 5
	number_of_waves 10
}

// Boden
#declare render_floor = false;

// Wände
#declare render_walls = true;

// Nullpunkt
#declare show_zero = false;
#declare show_metric_points = false;

// Messlatte(-n)
#declare show_yardstick = true;

// use_crackle
#declare use_crackle = false;

// Cameras:
#declare use_camera_number = 1; // 3;

// Licht
#declare use_area_s1 = true;
#declare use_area_s2 = true;

// Hülsen
#declare show_huelsen = false;

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
		angle		120// 54
	}
#break
#case(14)
	camera {
		location	<  5, 8, -12 >
		look_at		< -5.0, 0.3, -10.3>
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

// Boden
#if(render_floor = true)
plane {
	y,
	- 0.05
	
	texture {
		T_Wood22
		scale 0.2
	}
}
#end

// Wände
#if(render_walls = true)
plane {
	x,
	-5
	
	texture {
		pigment {
			White
		}
	}	
}
plane {
	z,
	-12
	texture {
		pigment {
			White
		}
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

#if(use_area_s1 = true)
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
#end

#if(use_area_s2 = true)
light_source {
	< 3.0, 8, -11>
	rgb <1.000000, 1.000000, 1.000000> * 2.0
	area_light <-3.0, 6.0, -5.0>, <5.0, 6.0, -10.0>, 5, 5
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
#end

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
		20,	// Breite
		8,	// Höhe
		14	// Länge
	)
	texture {
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
	// 1
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
	
	// 2
	#macro Messlatte2( pLaenge, pPigment1, pPigment2 )
		#local temp_size = 0.1;
		#local s2 = temp_size/2;
		#local nE = ceil( pLaenge/temp_size) -1;
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

	// 3
	#macro Messlatte3( pLaenge, pPigment1, pPigment2 )
		#local temp_size = 0.1;
		#local s2 = temp_size/2;
		#local nE = ceil( pLaenge/temp_size) -1;
		#local tN = 1;
		#local tN2 = 0;
		union {
			#for(i, 0, nE)
			object {
				box {
					< 0 +i* temp_size, 0, -s2/2 >,
					< 0 + (i+1)* temp_size, s2, s2/2	>
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
			#if( mod(i,2) = 0)
				object {
					box {
						< 0 +i* temp_size, -s2, -s2/2>,
						< 0 +(i+2)* temp_size, 0, s2/2>	
					}
					texture {
						#if( tN2 = 1)
							#local tN2 = 0;
							pigment { pPigment1 }
						#else
							#local tN2 = 1;
							pigment { pPigment2 }
						#end	
					}
				}
			#end
			
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
		Messlatte3(2 , White, Copper )
		// rotate < 0, 45, 0 >
		translate < -1, -0.3, 0 >	
	}
	object {
		Messlatte2(2 , White, Gray )
		rotate < 0, 0, 90 >
		translate < 1.27, 0, 0 >	
	}
#end

// ####### A
#macro Huelse( pDurchmesser, pLaenge, pDicke, pPhasenhoehe )
	#local temp_Radius = pDurchmesser/2;
	#local temp_innenradius = temp_Radius-pDicke;
	
	#local temp_phasenhoehe = pPhasenhoehe; // 0.013;
	#local temp_Hoehe =  (pLaenge/2)-(temp_phasenhoehe*2);
	
	object {
		difference {
			union {
				// 1
				object {
					cylinder {
						< 0,-temp_Hoehe, 0 >,
						< 0, temp_Hoehe, 0 >,
						temp_Radius	
					}
				}
				// 2 Phase oben
				object {
					difference {
						// unten
						object {
							cone {
								<0,temp_Hoehe,0>,
								temp_Radius,
								<0,temp_Hoehe+ temp_phasenhoehe,0>,
								temp_Radius-temp_phasenhoehe	
							}
						}
						// oben
						object {
							cone {
								<0,temp_Hoehe - 0.01,0>,
								temp_innenradius-temp_phasenhoehe,
								<0,temp_Hoehe+ temp_phasenhoehe+0.01,0>,
								temp_innenradius+(2*temp_phasenhoehe)	
							}
									
						}
					}
				}
				
				// 3 Phase unten
				object {
					difference {
						// oben
						object {
							cone {
								< 0, -temp_Hoehe - temp_phasenhoehe, 0 >,
								temp_Radius-temp_phasenhoehe,
								< 0, -temp_Hoehe , 0 >,
								temp_Radius	
							}
						}
						// unten
						object {
							cone {
								<0, -temp_Hoehe - temp_phasenhoehe - 0.01,0>,
								temp_innenradius + (2*temp_phasenhoehe),
								<0, - temp_Hoehe + 0.01,0>,
								temp_innenradius - temp_phasenhoehe	
							}
									
						}
						
					}
				}
			}
			// Zylinder innen
			object {
				cylinder {
					< 0,-temp_Hoehe-1.01, 0 >,
					< 0, temp_Hoehe+1.01, 0 >,
					temp_innenradius	
				}
			}
		}			
	}
#end

#macro Huelse_halbiert( pDurchmesser, pLaenge, pDicke, pPhasenhoehe, pWinkel )
	difference {
		Huelse( pDurchmesser, pLaenge, pDicke, pPhasenhoehe )
		
		plane {
			x, 0	
			rotate y*pWinkel
		}
	}
#end

////////// B
#macro Abgerundeter_Stab( pLaenge, pDurchmesser )
#local r = pDurchmesser / 2;
#local l = (pLaenge / 2)-r;

union {
	object {
		cylinder {
			< 0, -l, 0 >,
			< 0,  l, 0 >,
			r
		}	
	}
	
	object {
		sphere {
			< 0, -l, 0 >,
			r
		}
	}
	
	object {
		sphere {
			< 0, l, 0 >,
			r	
		}
	}
}
#end

///////////////////////////////////////////
#if(show_huelsen = true)
	
	#declare huelse_rotate_x = -90;
	#declare huelse_rotate_y = 240;
	#declare huelse_rotate_z = 0;

// #### A1
object {
	union {
		object {
			Huelse( 
				0.93,	// Duchmesser
				1.2,	// Länge
				0.21,	// Dicke/Stärke
				0.025	// Phasenhöhe
			)
			rotate < huelse_rotate_x, huelse_rotate_y, huelse_rotate_z>
			texture {
				T_Silver_3B
				scale 0.5
				rotate < 90, -15, 90 >
			}
			// Oberflächenstruktur
			normal{	
				bump_map{
		    		jpeg "Bilder/Aluminiumblech_02.jpg"
		     		map_type 0 // 0=planar, 1=spherical, 2=cylindrical, 5=torus
		     		interpolate 0
		     		//  0=none, 1=linear, 2=bilinear, 4=normalized distance
		   			//once // falls Bild nicht wiederholt werden soll.
		   			//use_color //
		     		bump_size 1
				} // end of bump_map,
		    	scale 4.2
		    }   // end of norm
		    // end
		}
		// 2
		object {
			Huelse( 
				1.23,	// Duchmesser
				0.3,	// Länge
				0.13,	// Dicke/Stärke
				0.015	// Phasenhöhe
			)
			translate < 0, 0.4, 0>
			rotate < huelse_rotate_x, huelse_rotate_y, huelse_rotate_z>
			
			texture {
				T_Brass_5D
				scale 0.5
				rotate < 90, -15, 90 >
			}
		}
		// 3
		object {
			Huelse( 
				1.53,	// Duchmesser
				0.5,	// Länge
				0.08,	// Dicke/Stärke
				0.015	// Phasenhöhe
			)
			translate < 0, 0.5, 0>
			rotate < huelse_rotate_x, huelse_rotate_y, huelse_rotate_z>
			
			texture {
				T_Copper_5D
				scale 0.5
				rotate < 90, -15, 90 >
			}
		}
		object {
			Abgerundeter_Stab( 
				1, // pLaenge, 
				0.18 // pDurchmesser
			)
			translate < 0, -0.5, 0>
			rotate < huelse_rotate_x, huelse_rotate_y, huelse_rotate_z>
			
			texture {
				T_Brass_5E
				scale 0.5
				rotate < 90, -15, 90 >
			}

		}
	}
	
	translate < 0, 0.3, 0>
}
#end // 

//	## C1
#macro Stab1( pBreite, pHoehe, pLaenge, pPhaseOben, pPhaseUnten )
	#local b2 = pBreite/2;
	#local h2 = pHoehe/2;
	#local l2 = pLaenge/2; 
object {
	prism {
		linear_spline
		// linear_sweep
		-l2
		l2,	//Top Height
		13,
		< -b2 - pPhaseOben, h2 >,	// P1
		<  b2 + pPhaseOben, h2 >,	// P2
		<  b2, h2 -pPhaseOben >,	// P3
		<  b2, -h2 + pPhaseUnten>,	// P4
		<  b2 + pPhaseUnten, -h2 >	// P5
		<  b2, -h2-pPhaseUnten >,	// P6
		<  b2-pPhaseUnten, -h2 >,	// P7
		< -b2+pPhaseUnten, -h2 >,	// P8
		< -b2, -h2-pPhaseUnten >,	// P9
		< -b2 -pPhaseUnten, -h2 >,	// P10
		< -b2, -h2 + pPhaseUnten >,	// P11
		< -b2, h2 - pPhaseOben >,	// P12
		< -b2 - pPhaseOben, h2 >	// P13 := P1
	}
	rotate < -90, 0, 0 >
}
#end

#macro Stab2( pBreite, pHoehe, pLaenge, pPhaseOben, pPhaseUnten )
	#local b2 = pBreite/2;
	#local h2 = pHoehe/2;
	#local l2 = pLaenge/2; 
object {
	prism {
		linear_spline
		// linear_sweep
		-l2
		l2,	//Top Height
		13,
		< -b2 + pPhaseOben, h2 >,	// P1
		<  b2 - pPhaseOben, h2 >,	// P2
		<  b2, h2 -pPhaseOben >,	// P3
		<  b2, -h2 + pPhaseUnten>,	// P4
		<  b2 + pPhaseUnten, -h2 >	// P5
		<  b2, -h2-pPhaseUnten >,	// P6
		<  b2-pPhaseUnten, -h2 >,	// P7
		< -b2+pPhaseUnten, -h2 >,	// P8
		< -b2, -h2-pPhaseUnten >,	// P9
		< -b2 -pPhaseUnten, -h2 >,	// P10
		< -b2, -h2 + pPhaseUnten >,	// P11
		< -b2, h2 - pPhaseOben >,	// P12
		< -b2 + pPhaseOben, h2 >	// P13 := P1
	}
	rotate < -90, 0, 0 >
}
#end

#macro Stab3( pBreite, pHoehe, pLaenge, pPhaseOben, pPhaseUnten )
	#local b2 = pBreite/2;
	#local h2 = pHoehe/2;
	#local l2 = pLaenge/2; 
object {
	prism {
		linear_spline
		// linear_sweep
		-l2
		l2,	//Top Height
		9,
		< -b2 + pPhaseOben, h2 >,	// P1
		<  b2 - pPhaseOben, h2 >,	// P2
		<  b2, h2 -pPhaseOben >,	// P3
		<  b2, -h2 + pPhaseUnten>,	// P4
//		<  b2 + pPhaseUnten, -h2 >	// P5 *
//		<  b2, -h2-pPhaseUnten >,	// P6 *
		<  b2-pPhaseUnten, -h2 >,	// P7
		< -b2+pPhaseUnten, -h2 >,	// P8
//		< -b2, -h2-pPhaseUnten >,	// P9 *
//		< -b2 -pPhaseUnten, -h2 >,	// P10 *
		< -b2, -h2 + pPhaseUnten >,	// P11
		< -b2, h2 - pPhaseOben >,	// P12
		< -b2 + pPhaseOben, h2 >	// P13 := P1
	}
	rotate < -90, 0, 0 >
}
#end

#declare show_staebe = false;

#if(show_staebe = true)
object {
	Stab1(
		0.7,
		0.5,
		0.3,
		0.05,
		0.05
	)
	texture {
		T_Brass_3E
		scale 0.5
		// rotate < 90, -15, 90 >
	}
	translate < 0, 0, -1>
}
object {
	Stab2(
		0.15,
		0.5,
		1.3,
		0.03,
		0.04
	)
	texture {
		T_Brass_5D
		scale 0.5
		// rotate < 90, -15, 90 >
	}
	translate <1, 0, -1>
}
object {
	Stab3(
		0.15,
		0.5,
		0.3,
		0.03,
		0.04
	)
	texture {
		T_Copper_5D
		scale 0.5
		// rotate < 90, -15, 90 >
	}
	translate < -1, 0, -1>
}
#end
/*
object {
union {
	
	object {
		difference {
		// union {
			// 1
			object {
				Huelse( 
					1.53,	// 	
					0.5,	// Länge
					0.38,	// Dicke/Stärke
					0.025	// Phasenhöhe
				)
			
				texture {
					T_Silver_3E
					scale 0.5
					// rotate < 90, -15, 90 >
				}
			
			}
		
			// 2	
			union {
				#local nElemente = 5;
				#local nWinkel = 360/nElemente;
				
				#for(i, 1, nElemente)
				
				object {
					Stab1(
						0.10,
						0.12,
						2.1,
						0.05,
						0.02
					)
					texture {
						T_Silver_3E
						scale 0.5
						// rotate < 90, -15, 90 >
					}
					rotate < 0, 0 , 0 >
					translate < 0, 0.185, 0> // r
					rotate < 0, i* nWinkel, 0 >
				}
				#end
			}
		
		}
	}
	// 2
	object {
		Stab2(
			0.10,
			0.12,
			2.1,
			0.01,
			0.015
		)
		texture {
			T_Copper_3E
			scale 0.5
			// rotate < 90, -15, 90 >
		}
		rotate < 0, 0 , 0 >
		translate < 0, 0.185, 0> // r
		// rotate < 0, 72, 0 >
	}

}
	// rotate < -30, 0, 0 >
}
*/
#declare Glass = texture {
   pigment {rgbf < 0.98, 0.98, 0.98, 1> }
   finish {
      specular 1
      roughness 0.001
      ambient 0
      diffuse 0
      reflection {
         0,1
         fresnel
      }
   }
}
/*
// kugel
object {
	sphere {
			<0.0, 0.0, 0.0>, 
			1.5
			
			scale < 1, 0.4, 1>
			
			translate < 0, -0.2, 0 >
		}
	texture {
		Glass
	}
	   interior {
	   	// I_Glass1
	   	I_Glass_Caustics1
//         ior 1.5
//         fade_distance 2
//         fade_power 2
      }
	finish { F_Glass10 }
}
*/
////////////////////

#macro Box2( pBreite, pHoehe, pTiefe, pPhasenhoehe, bPhase_x, bPhase_y, bPhase_z )
#local b2 = pBreite/2;
#local h2 = pHoehe/2;
#local t2 = pTiefe/2;
#local p2 = pPhasenhoehe/2;

difference {
	object	{
		box {
			< -b2, -h2, -t2 >,
			<  b2,  h2,  t2 >
		}
	}
	// x
	#if(bPhase_x = true)
		object {
			plane { x, 0 }
			rotate y*45
			translate < 0, 0, t2+b2-pPhasenhoehe >
		}
		object {
			plane { x, 0 }
			rotate y*-135
			translate < 0, 0, -t2-b2 +pPhasenhoehe >
		}
		object {
			plane { x, 0 }
			rotate y*-225
			translate < 0, 0, t2+b2-pPhasenhoehe >
		}
		object {
			plane { x, 0 }
			rotate y*315
			translate < 0, 0, -t2-b2+pPhasenhoehe >
		}
	#end
	// y
	#if(bPhase_y = true)
		object {
			plane { y, 0 }
			rotate z*45
			translate < b2+h2-pPhasenhoehe, 0, 0 >
		}
		object {
			plane { y, 0 }
			rotate z*-135
			translate < -b2-h2+pPhasenhoehe, 0, 0 >
		}
		object {
			plane { y, 0 }
			rotate z*-225
			translate < b2+h2-pPhasenhoehe, 0, 0 >
		}
		object {
			plane { y, 0 }
			rotate z*315
			translate < -b2-h2+pPhasenhoehe, 0, 0 >
		}
	#end
	// z
	#if(bPhase_z = true)
		object {
			plane { z, 0 }
			rotate x*45
			translate < 0, h2+t2-pPhasenhoehe, 0 >
		}
		object {
			plane { z, 0 }
			rotate x*-135
			translate < 0, -h2-t2 +pPhasenhoehe, 0 >
		}
		object {
			plane { z, 0 }
			rotate x*-225
			translate < 0, h2+t2-pPhasenhoehe, 0 >
		}
		object {
			plane { z, 0 }
			rotate x*315
			translate < 0, -h2-t2+pPhasenhoehe, 0 >
		}
	#end
}
#end

////////////////////
#declare show_tebath = false;

#if(show_tebath = true)

#declare xStepSize = 0.21;
#declare StabPositionen = array[7][6]
{
	{ // 1
		0, 0, 0,	// rotation x y z 
		0, 0, 0		// position x y z
	},
	{ // 2
		90, 0, 0,
		xStepSize,  0,  0
	},
	{ // 3
		90, 0, 0,
		-xStepSize, 0,  0
	},
	{ // 4
		0, 0, 90,
		0, xStepSize,  xStepSize
	},
	{ // 5
		0, 0, 90,
		0, xStepSize,  -xStepSize
	},
	{ // 6
		0, 0, 90,
		0, -xStepSize,  xStepSize
	},
	{ // 7
		0, 0, 90,
		0, -xStepSize,  -xStepSize
	}


}

object {
	union {
		#for(i, 0, 6)
			object {
				Box2( 
					0.2, 
					2, 
					0.2, 
					0.015,	// Phase
					true,
					true,
					true
				)
				rotate< StabPositionen[i][0], StabPositionen[i][1], StabPositionen[i][2] >
				translate < StabPositionen[i][3], StabPositionen[i][4], StabPositionen[i][5]>
			
			#if( i = 0)
				texture { T_Copper_3E scale 0.5 }
			#elseif (i < 3)
				texture { T_Copper_3C scale 0.5 }
			#else
				texture { T_Silver_3D scale 0.5 }
			#end
			}
		#end	
	}
		
	// translate < 0, 1, 0>
	rotate < 0, 45, 0>
	
}

#end
/*
object {
	height_field {
		jpeg "Bilder/Land_002.jpg"
		// smooth
		// water_level 0.1
	}
	scale 10
	rotate < 0, 0, 0 >	
	texture {
		T_Silver_3D	
	}
	translate < -2, 0.8, 2 >
}
*/

#declare T_Stone8_01 =
texture{pigment{color White}
        finish{ambient 0.2 crand 0.06 diffuse 0.7}
}
texture{T_Grnt0a scale <2, 1, 2> rotate <0, 0, -30>}
texture{T_Grnt9a scale <1, 3, 4> rotate <0, 0, 40>
        finish{phong 1.0 ambient 0.5 diffuse 0.3 phong_size 90}
}


object
{ union {
#declare x_BoxSize = 0.4;
#declare x_B2 = x_BoxSize/2;
#declare x_Scale = 0.03;
#declare x_Between = 0.014;
#for(i, 1, 4)
	#for(k, 1, 6)
		object{
			/*
			box {
				< -x_B2, -x_B2/2, -x_B2 >,
				<  x_B2,  x_B2/2,  x_B2 >	
			}*/
			Box2( 
					x_BoxSize, 
					x_BoxSize/5, 
					x_BoxSize, 
					0.015,	// Phase
					true,
					true,
					true
				)
			// rotate < -30, 0, 0>	
			translate < 
				-2.0+(k* (x_BoxSize +x_Between) ), 
				0.5,
				-2.5+(i* (x_BoxSize +x_Between) )
			>
			#local cc = (i-1)*6+k;
	/// ####1
	texture{ T_Stone8 scale x_Scale }
	#if( mod(cc, 2) + mod(i,2) = 0)
		texture{ T_Grnt17a scale x_Scale }
	#else
		texture{ T_Grnt19a scale x_Scale }
	#end
	/// ###		
			
		}
	#end
#end
} 
rotate < -90, 0, 0>
translate < 0, 2, -0.5>
}