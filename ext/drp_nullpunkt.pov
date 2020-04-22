/**
 *  a
 */
#macro nullpunkt_t( laenge )
#local durchmesser = 0.01;
//#local laenge = 2;
#local a = (2*durchmesser);
#local a2 = 8*a;
#local w = laenge/2;
#local tSize = 0.15;
object {
	union {
		// x
		object {
			cylinder {
				< -w, 0, 0>,
				<  w-a2, 0, 0>
				durchmesser
			}	
		}

		object {
			cone {
				< w-a2, 0, 0 >,
				a,
				< w, 0, 0 >,
				0	
			}	
		}
		
		object {
			text {
				ttf "crystal.ttf"
				"x"
				0.1, 0
				scale tSize
			}
			translate < -w, 0, 0 >
		}

		// y		
		object {
			cylinder {
				<  0, -w, 0>,
				<  0,  w-a2, 0>
				durchmesser
			}	
		}

		object {
			cone {
				< 0, w-a2, 0 >,
				a,
				< 0, w, 0 >,
				0	
			}	
		}

		object {
			text {
				ttf "crystal.ttf"
				"y"
				0.1, 0
				scale tSize
			}
			translate < 0.07, w-a2, 0 >
		}

		// z
		object {
			cylinder {
				<  0, 0, -w>,
				<  0, 0,  w-a2>
				durchmesser
			}	
		}

		object {
			cone {
				< 0, 0, w-a2 >,
				a,
				< 0, 0, w >,
				0	
			}	
		}	
		
		object {
			text {
				ttf "crystal.ttf"
				"z"
				0.1, 0
				scale tSize
			}
			translate < w-a2, 0.07, 0 >
			rotate y*90
		}
	
	}
	material {
		texture {
			T_Stone32
			scale 0.8
		}
	}
	
}
#end

/*****
 *
 **/
#macro nullpunkt( laenge )
#local durchmesser = 0.01;
//#local laenge = 2;
#local a = (2*durchmesser);
#local a2 = 8*a;
#local w = laenge/2;
#local tSize = 0.15;
object {
	union {
		// x
		object {
			cylinder {
				< -w, 0, 0>,
				<  w-a2, 0, 0>
				durchmesser
			}	
		}

		object {
			cone {
				< w-a2, 0, 0 >,
				a,
				< w, 0, 0 >,
				0	
			}	
		}
		
		// y		
		object {
			cylinder {
				<  0, -w, 0>,
				<  0,  w-a2, 0>
				durchmesser
			}	
		}

		object {
			cone {
				< 0, w-a2, 0 >,
				a,
				< 0, w, 0 >,
				0	
			}	
		}

		// z
		object {
			cylinder {
				<  0, 0, -w>,
				<  0, 0,  w-a2>
				durchmesser
			}	
		}

		object {
			cone {
				< 0, 0, w-a2 >,
				a,
				< 0, 0, w >,
				0	
			}	
		}	
			
	}
	material {
		texture {
			T_Stone32
			scale 0.8
		}
	}
	
}
#end
