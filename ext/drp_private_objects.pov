/////////////////
#macro element7( rad, hoehe, steg )

	#local h = hoehe/2;
	#local h2 = h+0.01;
	#local rad2 = rad-steg;
	#local radx = rad*0.80;

object {
	difference
	{
		// 1
		union {
			object {
				cylinder {
					< -radx,-h,0>,
					< -radx, h ,0>,
					rad
				}				
			}
			object {
				cylinder {
					< radx, -h,0>,
					< radx,  h ,0>,
					rad
				}				
			}
			object {
				cylinder {
					< 0,-h,-radx>,
					< 0, h ,-radx>,
					rad
				}				
			}
			object {
				cylinder {
					< 0,-h, radx>,
					< 0, h , radx>,
					rad
				}				
			}
		}
		// 2
		union {
			object {
				cylinder {
					< -radx,-h2,0>,
					< -radx, h2 ,0>,
					rad2
				}				
			}
			object {
				cylinder {
					< radx, -h2,0>,
					< radx,  h2 ,0>,
					rad2
				}				
			}
			object {
				cylinder {
					< 0,-h2,-radx>,
					< 0, h2 ,-radx>,
					rad2
				}				
			}
			object {
				cylinder {
					< 0,-h2, radx>,
					< 0, h2 , radx>,
					rad2
				}				
			}
			object {
				cylinder {
					< 0,-h2, 0>,
					< 0, h2 , 0>,
					rad2
				}
			}
		}
	}
}
#end
