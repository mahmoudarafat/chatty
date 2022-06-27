<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Client extends Model
{
    protected $table = 'clients';
    public $timestamps = true;
    protected $guarded = array('id');
    protected $appends = [
        'online_status', 'country_name', 'timezone',
       // 'opened_tasks', 'closed_tasks',
        'opened_tasks_count', 'closed_tasks_count'
    ];

    public function accounts()
    {
        return $this->hasMany(Account::class);
    }

    public function getCountryNameAttribute()
    {
        return $this->countryID->name_ar ?? "NAN";
    }

    public function getOpenedTasksAttribute()
    {
        return $this->tasksQuery()->open()->get();
    }

    public function getClosedTasksCountAttribute()
    {
        return $this->tasksQuery()->close()->count();
    }


    public function getOpenedTasksCountAttribute()
    {
        return $this->tasksQuery()->open()->count();
    }

    public function getClosedTasksAttribute()
    {
        return $this->tasksQuery()->close()->get();
    }

    public function getTasksCountAttribute()
    {
        return $this->tasksQuery()->count();
    }

    public function tasksQuery()
    {
        return Task::where('support_code', $this->id);
    }

    public function getOnlineStatusAttribute()
    {
        return true;
//        return Carbon::now()->diffInSeconds(Carbon::parse($this->last_update)) > 60 ? false : true;
    }

    public function countryID()
    {
        return $this->belongsTo('App\Models\Country', 'country');
    }

    public function city()
    {
        return $this->belongsTo('App\Models\City');
    }

    public function activity()
    {
        return $this->belongsTo('App\Models\Activity');
    }

    public function particiption()
    {
        return $this->hasMany(Participation::class);
    }

    public function getTimezoneAttribute()
    {
        return optional($this->countryID)->zone_name ?? config('chatify.timezone');
    }

}
