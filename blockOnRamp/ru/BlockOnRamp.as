package  
{
	import inobr.eft.common.ui.BlockFormat;
	import inobr.eft.vector.core.*;
	import inobr.eft.vector.lang.ru;
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
			// добавляем формулировку задачи
			var formulation:Bitmap = new Formulation();
			addChild(formulation);
			
			// устанавливаем параметры области рисунка (язык и шаг вращения вектора)
			var forceDiagram:ForceDiagramWorkspace = new ForceDiagramWorkspace(ru);
			forceDiagram.rotationStep = 10;
			
			// настраиваем область рисунка (фоновый рисунок и точки приложения сил)
			forceDiagram.drawingArea.setPosition(187, 55);
			forceDiagram.drawingArea.ground = new GroundImage();
			
			var bodyCenter:Fulcrum = new Fulcrum(156, 146);
			forceDiagram.drawingArea.addFulcrum(bodyCenter);
			
			// настраиваем панель инструментов (добавляем векторы)
			forceDiagram.toolbar.setSize(167, 185);
			forceDiagram.toolbar.addVector("F_тр", 40, 210, bodyCenter);
			forceDiagram.toolbar.addVector("F_тяж", 80, 90, bodyCenter);
			forceDiagram.toolbar.addVector("N", 80, 300, bodyCenter);
			
			// визуализируем рабочую область
			addChild(forceDiagram);
		}
	}

}