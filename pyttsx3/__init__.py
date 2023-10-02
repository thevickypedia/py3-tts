import weakref

from .engine import Engine

version = '3.5'
_activeEngines = weakref.WeakValueDictionary()


# noinspection PyPep8Naming
def init(driverName: str = None, debug: bool = False) -> Engine:
    """
    Constructs a new TTS engine instance or reuses the existing instance for
    the driver name.

    @param driverName: Name of the platform specific driver to use. If
        None, selects the default driver for the operating system.
    @type: str
    @param debug: Debugging output enabled or not
    @type debug: bool
    @return: Engine instance
    @rtype: L{engine.Engine}
    """
    try:
        eng = _activeEngines[driverName]
    except KeyError:
        try:
            eng = Engine(driverName=driverName, debug=debug)
        except ModuleNotFoundError:
            raise ValueError("\n\nDriver '%s' is unavailable" % driverName)
        except Exception:
            raise RuntimeError("\n\nUnable to load driver '%s'" % driverName)
    _activeEngines[driverName] = eng
    return eng
