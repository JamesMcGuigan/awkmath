/* This file generated by AWKA */

#include <libawka.h>
#include <setjmp.h>

int _split_req = 0, _split_max = INT_MAX;

extern int _dol0_used;
extern char _dol0_only;
extern char _env_used;
extern int _max_base_gc, _max_fn_gc;
extern struct awka_fn_struct *_awkafn;
jmp_buf context;
a_VAR *COUNT_awk = NULL;

struct gvar_struct *_gvar;

a_VAR **_lvar;
a_VAR *_litd0_awka=NULL, *_litd1_awka=NULL;
void BEGIN();
void MAIN();
void END();

void
BEGIN()
{
  awka_vardblset(COUNT_awk, 0);

}


void
END()
{
  awka_print(NULL, 0, 0, awka_arg1(a_TEMP, COUNT_awk));

}


void
MAIN()
{
  int i, _curfile;
  if (*(awka_gets(a_bivar[a_FILENAME])) == '\0')
    awka_strcpy(a_bivar[a_FILENAME], "");
  i = setjmp(context);
  while (awka_getline(a_TEMP, awka_dol0(0), awka_gets(a_bivar[a_FILENAME]), FALSE, TRUE)->dval > 0 && awka_setNF())
  {
    if (awka_vartrue(isnumber_fn(awka_arg1(a_TEMP, awka_doln(1, 0)))))
    {
      awka_setd(COUNT_awk) += 1;
    }
    nextrec:;
  }
}

int
main(int argc, char *argv[])
{
  _max_base_gc = 3;
  _max_fn_gc = 2;

  awka_varinit(COUNT_awk);

  awka_varinit(_litd0_awka); awka_setd(_litd0_awka) = 0;
  awka_varinit(_litd1_awka); awka_setd(_litd1_awka) = 1;

  if (!_lvar) {
    malloc( &_lvar, 3 * sizeof(a_VAR *) );
    _lvar[0] = _litd0_awka;
    _lvar[1] = _litd1_awka;
    _lvar[2] = NULL;
  }

  malloc( &_gvar, 2 * sizeof(struct gvar_struct) );
  awka_initgvar(0, "COUNT_awk", COUNT_awk);
  _gvar[1].name = NULL;
  _gvar[1].var  = NULL;

  malloc( &_awkafn, 1 * sizeof(struct awka_fn_struct) );
  _awkafn[0].name = NULL;
  _awkafn[0].fn   = NULL;

  awka_init(argc, argv, "0.7.5", "12 July 2001");

  _split_max = 1;
  _split_req = 1;
  _dol0_used = 1;

  BEGIN();
  MAIN();
  END();

  free(_litd0_awka);
  free(_litd1_awka);

  awka_exit(0);
}
