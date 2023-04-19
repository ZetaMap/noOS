#include "script_template.h"

namespace Code {

constexpr ScriptTemplate emptyScriptTemplate(".py", "\x01" R"(from math import *
)");

constexpr ScriptTemplate hidenerScriptTemplate("script_hiderner_tool.py", "\x01" R"(from os import *
print('Hidener python script tool started! \n\nListing files ...')
FILES = listdir()
FILES.remove(__name__+'.py')
print('Creating loader ...')
with open('.show', 'w') as f: f.write(r'''from os import *
print('Hidener python script tool started! \n\nShowing files ...')
for i in {}:
  try:
    if i.startswith('.'): rename(i, i[1:]+'.py')
    else: rename('.'+i[:i.rindex('.')], i)
  except OSError: print('WARINNG: hidden version of \''+i+'\' not found, can\'t restore')
print('Self deleting ...')
if __name__ != '__main__': remove(__name__+'.py')
remove('.show')
print('All done!')'''.format(FILES))
f.close()
print('Hiding files ...')
for i in FILES: 
  if not i.startswith('.'): rename(i, '.'+i[:i.rindex('.')])
print('Self deleting ...')
remove(__name__+'.py')
print('All done! \n\nTo unhide files, \nrun exec(open(\".show\").read()) in the shell')
)");


const ScriptTemplate * ScriptTemplate::Empty() {
  return &emptyScriptTemplate;
}

const ScriptTemplate * ScriptTemplate::Hidener() {
  return &hidenerScriptTemplate;
}

}
