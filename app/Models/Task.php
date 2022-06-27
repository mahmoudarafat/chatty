<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    protected $connection = 'mysql_2';


    public function scopeOpen($query)
    {
        $query->whereHas('taskStatus', function ($q1) {
            $q1->where('type', 'open');
        });

    }

    public function scopeClose($query)
    {
        $query->whereHas('taskStatus', function ($q1) {
            $q1->where('type', 'close');
        });

    }

    public function taskStatus()
    {
        return $this->belongsTo(TaskStatus::class);
    }

}
