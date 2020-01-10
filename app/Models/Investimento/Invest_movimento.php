<?php

namespace App\Models\Investimento;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Invest_movimento extends Model
{
	use \OwenIt\Auditing\Auditable;

    protected $fillable = ['pessoa_id', 'conta_id', 'ativo_id', 'mes', 'ano', 'totalcompra', 'totalvenda', 'totaldividendos', 'saldo'];
    protected $table 	= 'investMovimento';

    public $timestamps = false;
}
