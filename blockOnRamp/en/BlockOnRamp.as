package  
{
	import inobr.eft.common.ui.BlockFormat;
	import inobr.eft.vector.core.*;
	import inobr.eft.vector.lang.en;
	import flash.display.Bitmap;
	/**
	 * @author Peter Gerasimenko, gpstmp@gmail.com
	 */
	[SWF(width = "500", height = "390", frameRate = "30", backgroundColor = "#2581C0")]	
	public class BlockOnRamp extends Initializer
	{
		[Embed(source="formulation.png")]
		private var Formulation:Class;
		
		[Embed(source="ground.png")]
		private var GroundImage:Class;
		
		override protected function initialize():void
		{
			// add formulation of the task
			var formulation:Bitmap = new Formulation();
			addChild(formulation);
			
			// set the parameters of the drawing workspace (language and rotation step)
			var forceDiagram:ForceDiagramWorkspace = new ForceDiagramWorkspace(en);
			forceDiagram.rotationStep = 10;
			
			// configure drawing area with background image and fulcrums
			forceDiagram.drawingArea.setPosition(187, 55);
			forceDiagram.drawingArea.ground = new GroundImage();
			
			var bodyCenter:Fulcrum = new Fulcrum(156, 146);
			forceDiagram.drawingArea.addFulcrum(bodyCenter);
			
			// configure toolbar with vectors
			forceDiagram.toolbar.setSize(167, 185);
			forceDiagram.toolbar.addVector("F_f", 40, 210, bodyCenter);
			forceDiagram.toolbar.addVector("F_mg", 80, 90, bodyCenter);
			forceDiagram.toolbar.addVector("N", 80, 300, bodyCenter);
			
			// visualize workspace
			addChild(forceDiagram);
		}
	}

}