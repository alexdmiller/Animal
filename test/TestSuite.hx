import massive.munit.TestSuite;

import EntityTest;
import EventEmitterTest;
import SystemTest;

/**
 * Auto generated Test Suite for MassiveUnit.
 * Refer to munit command line tool for more information (haxelib run munit)
 */

class TestSuite extends massive.munit.TestSuite
{		

	public function new()
	{
		super();

		add(EntityTest);
		add(EventEmitterTest);
		add(SystemTest);
	}
}
