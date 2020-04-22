/**
 *	drp stifte
 *	Private Objekte
 *
 *	Version 0.1.0
 *
 */

#macro Stift_A_00 ( Durchmesser_Kopf, Hoehe_Kopf, Durchmesser_Stift, Laenge_Stift )
object {
	union {
		// Kopf
		object {
			cylinder {
				< 0, Laenge_Stift, 0>,
				< 0, Laenge_Stift + Hoehe_Kopf, 0>,
				Durchmesser_Kopf
			}
		}
		// Stift
		object {
			cylinder {
				< 0, 0, 0>,
				< 0, Laenge_Stift, 0>,
				Durchmesser_Stift
			}
		}
	}
}
#end

#macro Stift_A_00_H ( Durchmesser_Kopf, Hoehe_Kopf, Durchmesser_Stift, Laenge_Stift, Breite_Rand )
object {
	difference {
		// Stift 1
		object {
			Stift_A_00 ( Durchmesser_Kopf, Hoehe_Kopf, Durchmesser_Stift, Laenge_Stift )
		}
		// Stift 2
		object {
			Stift_A_00 ( Durchmesser_Kopf-Breite_Rand, Hoehe_Kopf+0.02, Durchmesser_Stift-Breite_Rand, Laenge_Stift+0.01 )
		}
	}
}
#end

#macro Stift_A_45 ( Durchmesser_Kopf, Hoehe_Kopf, Durchmesser_Stift, Laenge_Stift )
object {
	union {
		// Kopf
		object {
			cylinder {
				< 0, Laenge_Stift, 0>,
				< 0, Laenge_Stift + Hoehe_Kopf, 0>,
				Durchmesser_Kopf
			}
		}
		// Stift
		object {
			cylinder {
				< 0, 0, 0>,
				< 0, Laenge_Stift, 0>,
				Durchmesser_Stift
			}
		}
		// Phase
		object {
			cone {
				<0, Laenge_Stift - Durchmesser_Kopf,0>,
				0.01,
				<0, Laenge_Stift ,0>,
				Durchmesser_Kopf
			}	
		}
	}
}
#end

#macro Stift_A_60 ( Durchmesser_Kopf, Hoehe_Kopf, Durchmesser_Stift, Laenge_Stift )
object {
	union {
		// Kopf
		object {
			cylinder {
				< 0, Laenge_Stift, 0>,
				< 0, Laenge_Stift + Hoehe_Kopf, 0>,
				Durchmesser_Kopf
			}
		}
		// Stift
		object {
			cylinder {
				< 0, 0, 0>,
				< 0, Laenge_Stift, 0>,
				Durchmesser_Stift
			}
		}
		// Phase
		object {
			cone {
				<0, Laenge_Stift - (Durchmesser_Kopf*2),0>,
				0.01,
				<0, Laenge_Stift ,0>,
				Durchmesser_Kopf
			}	
		}
	}
}
#end

#macro Stift_A_XX ( Durchmesser_Kopf, Hoehe_Kopf, Durchmesser_Stift, Laenge_Stift )
object {
	union {
		// Kopf
		object {
			cylinder {
				< 0, Laenge_Stift, 0>,
				< 0, Laenge_Stift + Hoehe_Kopf, 0>,
				Durchmesser_Kopf
			}
		}
		// Stift
		object {
			cylinder {
				< 0, 0, 0>,
				< 0, Laenge_Stift, 0>,
				Durchmesser_Stift
			}
		}
		// Phase
		object {
			sphere {
				<0, Laenge_Stift ,0>,
				Durchmesser_Kopf
			}	
		}
	}
}
#end
